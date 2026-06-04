import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

part 'daily_card_bloc.freezed.dart';
part 'daily_card_state.dart';
part 'daily_card_event.dart';

class DailyCardBloc extends Bloc<DailyCardEvent, DailyCardState> {
  final DailyCardRepository _repository;

  DailyCardBloc(this._repository) : super(const _Initial()) {
    on<DailyCardEvent>(
      (event, emit) => switch (event) {
        final _LoadTodayCard _ => _onLoadTodayCard(emit),
        final _AnswerCard a => _onAnswerCard(
          emit,
          a.cardId,
          a.isCorrect,
          a.explanation,
          a.isMyth,
        ),
        final _Close _ => _onClose(emit),
      },
    );
  }

  Future<void> _onLoadTodayCard(Emitter<DailyCardState> emit) async {
    emit(const Loading());
    
    const maxRetries = 2;
    const timeout = Duration(seconds: 3);
    
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        print('=== ПОПЫТКА ЗАГРУЗКИ КАРТОЧКИ $attempt/$maxRetries ===');
        
        // Загружаем с таймаутом
        final answeredCard = await _repository
            .getAnsweredCardForToday()
            .timeout(timeout);

        if (answeredCard != null) {
          final card = answeredCard['card'] as DailyCardEntity;
          emit(
            Answered(
              isCorrect: answeredCard['is_correct'] as bool,
              explanation: card.explanation,
              isMyth: card.isMyth,
            ),
          );
          return;
        }

        final card = await _repository.getTodayCard().timeout(timeout);
        if (card == null) {
          emit(const NoMoreCards());
          return;
        }

        emit(Loaded(card: card, hasAnsweredToday: false));
        return;
        
      } catch (e) {
        print('=== ОШИБКА ЗАГРУЗКИ (попытка $attempt): $e ===');
        
        if (attempt == maxRetries) {
          emit(const Error(message: 'Не удалось загрузить карточку. Проверьте подключение к интернету.'));
        } else {
          // Ждём 1 секунду перед следующей попыткой
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    }
  }

  Future<void> _onAnswerCard(
    Emitter<DailyCardState> emit,
    int cardId,
    bool isCorrect,
    String explanation,
    bool isMyth,
  ) async {
    emit(const Loading());
    
    const maxRetries = 2;
    const timeout = Duration(seconds: 3);
    
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        print('=== ПОПЫТКА СОХРАНЕНИЯ ОТВЕТА $attempt/$maxRetries ===');
        
        await _repository
            .saveUserAnswer(cardId, isCorrect)
            .timeout(timeout);
            
        emit(Answered(
          isCorrect: isCorrect,
          explanation: explanation,
          isMyth: isMyth,
        ));
        return;
        
      } catch (e) {
        print('=== ОШИБКА СОХРАНЕНИЯ (попытка $attempt): $e ===');
        
        if (attempt == maxRetries) {
          emit(const Error(message: 'Не удалось сохранить ответ. Проверьте подключение к интернету.'));
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    }
  }

  Future<void> _onClose(Emitter<DailyCardState> emit) async {
    emit(const _Initial());
  }
}