import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart'
    as list;
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

void main() {
  test('finishes a level only once after a duplicate next event', () async {
    const level = GameModuleLevelEntity(
      id: 1,
      orderIndex: 1,
      theoryModuleId: 1,
      totalQuestions: 1,
    );
    const question = GameModuleQuestionEntity(
      id: 1,
      question: 'Вопрос',
      questionType: QuestionType.multipleChoice,
      answers: ['A', 'B'],
      explanation: 'Объяснение',
      orderIndex: 1,
      levelId: 1,
      correctAnswer: 'A',
    );
    final levelRepository = _LevelRepository(question);
    final levelListRepository = _LevelListRepository(level);
    final progressRepository = _ProgressRepository();
    final moduleListBloc = list.GameModuleListBloc(
      gameModuleLevelListRepository: levelListRepository,
      gameProgressRepository: progressRepository,
    );
    final bloc = GameModuleLevelBloc(
      gameModuleLevelRepository: levelRepository,
      gameModuleLevelListRepository: levelListRepository,
      levelProgressRepository: progressRepository,
      gameModuleListBloc: moduleListBloc,
      achievementRepository: _AchievementRepository(),
    );

    var nextState = bloc.stream.firstWhere(
      (state) => state is ReceiveSuccess && state.currentIndex == -1,
    );
    bloc.add(const GameModuleLevelEvent.receive(levelId: 1));
    await nextState;

    nextState = bloc.stream.firstWhere(
      (state) => state is ReceiveSuccess && state.currentIndex == 0,
    );
    bloc.add(const GameModuleLevelEvent.startLevel());
    await nextState;

    final answered = bloc.stream.firstWhere(
      (state) => state is AnswerInProgress,
    );
    bloc.add(const GameModuleLevelEvent.answerMultipleChoice(answer: 'B'));
    await answered;

    bloc.add(const GameModuleLevelEvent.nextQuestion());
    bloc.add(const GameModuleLevelEvent.nextQuestion());
    await progressRepository.saveStarted.future;

    expect(progressRepository.saveCalls, 1);
    final completed = bloc.stream.firstWhere(
      (state) => state is LevelCompleted,
    );
    progressRepository.allowSave.complete();
    await completed;
    expect(progressRepository.saveCalls, 1);

    await bloc.close();
    await moduleListBloc.close();
  });
}

class _LevelRepository implements GameModuleLevelRepository {
  _LevelRepository(this.question);

  final GameModuleQuestionEntity question;

  @override
  Future<Map<int, String>> getCharacterImagesForLevel({
    required int levelId,
  }) async => const {};

  @override
  Future<String?> getCharacterImageUrl(int characterId) async => null;

  @override
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
  }) async => [question];
}

class _LevelListRepository implements GameModuleLevelListRepository {
  _LevelListRepository(this.level);

  final GameModuleLevelEntity level;

  @override
  Future<List<GameModuleLevelEntity>> getAllLevels() async => [level];

  @override
  Future<GameModuleLevelEntity> getLevelById({required int levelId}) async =>
      level;
}

class _ProgressRepository implements LevelProgressRepository {
  final saveStarted = Completer<void>();
  final allowSave = Completer<void>();
  int saveCalls = 0;

  @override
  Future<Map<int, LevelProgressEntity>> getAllLevelsProgress() async =>
      const {};

  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async =>
      null;

  @override
  Future<bool> isLevelCompleted(int levelId) async => false;

  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) async {
    saveCalls++;
    if (!saveStarted.isCompleted) saveStarted.complete();
    await allowSave.future;
  }
}

class _AchievementRepository implements AchievementRepository {
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
  }) async => null;
}
