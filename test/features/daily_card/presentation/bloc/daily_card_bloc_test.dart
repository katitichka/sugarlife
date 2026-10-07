import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';
import 'package:sugarlife/features/daily_card/presentation/bloc/daily_card_bloc.dart';

void main() {
  test(
    'ignores a duplicate answer while the first one is being saved',
    () async {
      const card = DailyCardEntity(
        id: 1,
        question: 'Вопрос',
        isMyth: false,
        explanation: 'Объяснение',
        dayNumber: 1,
      );
      final repository = _DailyCardRepository(card);
      final achievementRepository = _AchievementRepository();
      final bloc = DailyCardBloc(
        repository: repository,
        achievementRepository: achievementRepository,
      );

      final loaded = bloc.stream.firstWhere((state) => state is Loaded);
      bloc.add(const DailyCardEvent.loadTodayCard());
      await loaded;

      const event = DailyCardEvent.answerCard(
        cardId: 1,
        isCorrect: true,
        explanation: 'Объяснение',
        isMyth: false,
      );
      bloc.add(event);
      bloc.add(event);
      await repository.saveStarted.future;

      expect(repository.saveCalls, 1);
      repository.allowSave.complete();
      await bloc.stream.firstWhere((state) => state is Answered);

      expect(repository.saveCalls, 1);
      expect(achievementRepository.unlockCalls, 1);
      await bloc.close();
    },
  );
}

class _DailyCardRepository implements DailyCardRepository {
  _DailyCardRepository(this.card);

  final DailyCardEntity card;
  final saveStarted = Completer<void>();
  final allowSave = Completer<void>();
  int saveCalls = 0;

  @override
  Future<AnsweredDailyCardEntity?> getAnsweredCardForToday() async => null;

  @override
  Future<List<bool>> getAnswerHistory() async => const [true];

  @override
  Future<DailyCardEntity?> getTodayCard() async => card;

  @override
  Future<bool> hasAnsweredToday() async => false;

  @override
  Future<void> saveUserAnswer(int cardId, bool isCorrect) async {
    saveCalls++;
    if (!saveStarted.isCompleted) saveStarted.complete();
    await allowSave.future;
  }
}

class _AchievementRepository implements AchievementRepository {
  int unlockCalls = 0;

  @override
  Future<List<AchievementEntity>> getAllAchievements() async => const [];

  @override
  Future<AchievementEntity?> getPendingAchievement() async => null;

  @override
  Future<List<AchievementEntity>> getUserAchievements() async => const [];

  @override
  Future<void> markAchievementCardShown({required int achievementId}) async {}

  @override
  Future<AchievementEntity?> unlockRandomAchievement({
    required AchievementType type,
  }) async {
    unlockCalls++;
    return null;
  }
}
