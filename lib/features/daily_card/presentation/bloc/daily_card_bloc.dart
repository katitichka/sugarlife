import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/core/utils/retry.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

part 'daily_card_bloc.freezed.dart';
part 'daily_card_state.dart';
part 'daily_card_event.dart';

class DailyCardBloc extends Bloc<DailyCardEvent, DailyCardState> {
  final DailyCardRepository _repository;
  final AchievementRepository _achievementRepository;

  DailyCardBloc(this._repository, this._achievementRepository)
    : super(const _Initial()) {
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

    const timeout = Duration(seconds: 3);

    try {
      final result = await withRetry<
          ({AnsweredDailyCardEntity? answered, DailyCardEntity? card})>(() async {
        final answeredCard = await _repository
            .getAnsweredCardForToday()
            .timeout(timeout);
        if (answeredCard != null) {
          return (answered: answeredCard, card: null);
        }
        final card = await _repository.getTodayCard().timeout(timeout);
        return (answered: null, card: card);
      }, delay: const Duration(seconds: 1));

      final answeredCard = result.answered;
      final card = result.card;
      if (answeredCard != null) {
        emit(
          Answered(
            isCorrect: answeredCard.isCorrect,
            explanation: answeredCard.card.explanation,
            isMyth: answeredCard.card.isMyth,
          ),
        );
      } else if (card != null) {
        emit(Loaded(card: card, hasAnsweredToday: false));
      } else {
        emit(const NoMoreCards());
      }
    } catch (e) {
      emit(const Error(message: 'Не удалось загрузить карточку. Проверьте подключение к интернету.'));
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

    const timeout = Duration(seconds: 3);

    try {
      await withRetry(
        () => _repository.saveUserAnswer(cardId, isCorrect).timeout(timeout),
        maxAttempts: 2,
        delay: const Duration(seconds: 1),
      );

      try {
        await _checkAndUnlockDailyAchievement();
      } catch (e) {
        // Достижение — не критичная часть флоу ответа, ошибку не показываем.
      }

      emit(Answered(
        isCorrect: isCorrect,
        explanation: explanation,
        isMyth: isMyth,
      ));
    } catch (e) {
      emit(const Error(message: 'Не удалось сохранить ответ. Проверьте подключение к интернету.'));
    }
  }

  Future<void> _onClose(Emitter<DailyCardState> emit) async {
    emit(const _Initial());
  }

  /// Достижения типа [AchievementType.daily] выдаются за жизненные рубежи:
  /// первая карточка отвечена верно, лучшая серия правильных ответов подряд
  /// достигла 3, 5 или 10. Как и с модулями, конкретное достижение к рубежу
  /// не привязано (в БД такой связи нет) — сравниваем количество уже
  /// полученных достижений типа daily с количеством пройденных рубежей.
  Future<void> _checkAndUnlockDailyAchievement() async {
    final answers = await _repository.getAnswerHistory();
    final milestonesReached = _dailyMilestonesReached(answers);
    if (milestonesReached == 0) return;

    final userAchievements = await _achievementRepository.getUserAchievements();
    final unlockedDailyCount =
        userAchievements.where((a) => a.type == AchievementType.daily).length;

    if (unlockedDailyCount >= milestonesReached) return;

    await _achievementRepository.unlockRandomAchievement(
      type: AchievementType.daily,
    );
  }

  int _dailyMilestonesReached(List<bool> answersChronological) {
    if (answersChronological.isEmpty) return 0;

    var milestones = answersChronological.first ? 1 : 0;

    var currentStreak = 0;
    var bestStreak = 0;
    for (final correct in answersChronological) {
      if (correct) {
        currentStreak++;
        if (currentStreak > bestStreak) bestStreak = currentStreak;
      } else {
        currentStreak = 0;
      }
    }

    if (bestStreak >= 3) milestones++;
    if (bestStreak >= 5) milestones++;
    if (bestStreak >= 10) milestones++;

    return milestones;
  }
}