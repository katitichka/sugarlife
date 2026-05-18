import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/errors/error_mapper.dart';
import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

part 'daily_card_bloc.freezed.dart';
part 'daily_card_state.dart';
part 'daily_card_event.dart';

class DailyCardBloc extends Bloc<DailyCardEvent, DailyCardState> {
  final DailyCardRepository _repository;

  DailyCardBloc(this._repository) : super(const _Initial()) {
    on<DailyCardEvent>((event, emit) => switch (event) {
          final _LoadTodayCard _ => _onLoadTodayCard(emit),
          final _AnswerCard a => _onAnswerCard(emit, a.cardId, a.isCorrect, a.explanation),
          final _Close _ => _onClose(emit),
        });
  }

  Future<void> _onLoadTodayCard(Emitter<DailyCardState> emit) async {
    emit(const Loading());
    try {
      final answeredCard = await loadWithRetry(
        _repository.getAnsweredCardForToday,
      );

      if (answeredCard != null) {
        final card = answeredCard['card'] as DailyCardEntity;
        emit(Answered(
          isCorrect: answeredCard['is_correct'] as bool,
          explanation: card.explanation,
        ));
        return;
      }

      final card = await loadWithRetry(_repository.getTodayCard);
      if (card == null) {
        emit(const NoMoreCards());
        return;
      }

      emit(Loaded(card: card, hasAnsweredToday: false));
    } catch (e) {
      emit(
        Error(
          message: ErrorMapper.toUserMessage(
            e,
            loadContext: ErrorMessages.loadFailed,
          ),
        ),
      );
    }
  }

  Future<void> _onAnswerCard(
    Emitter<DailyCardState> emit,
    int cardId,
    bool isCorrect,
    String explanation,
  ) async {
    emit(const Loading());
    try {
      await _repository.saveUserAnswer(cardId, isCorrect);
      emit(Answered(isCorrect: isCorrect, explanation: explanation));
    } catch (e) {
      emit(
        Error(
          message: ErrorMapper.toUserMessage(
            e,
            saveContext: ErrorMessages.saveFailed,
          ),
        ),
      );
    }
  }

  Future<void> _onClose(Emitter<DailyCardState> emit) async {
    emit(const _Initial());
  }
}