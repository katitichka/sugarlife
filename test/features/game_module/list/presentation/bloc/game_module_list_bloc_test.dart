import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

void main() {
  test('a worse replay does not downgrade optimistic progress', () async {
    const level = GameModuleLevelEntity(
      id: 1,
      orderIndex: 1,
      theoryModuleId: 1,
      totalQuestions: 3,
    );
    final oldProgress = LevelProgressEntity(
      levelId: 1,
      isCompleted: true,
      stars: 3,
      lastPlayedAt: DateTime(2026),
      correctAnswers: 3,
    );
    final progressRepository = _ProgressRepository({1: oldProgress});
    final bloc = GameModuleListBloc(
      gameModuleLevelListRepository: _LevelListRepository([level]),
      gameProgressRepository: progressRepository,
    );

    bloc.add(const GameModuleListEvent.receive());
    await bloc.stream.firstWhere((state) => state is ReceiveSuccess);
    progressRepository.failRefresh = true;

    bloc.add(
      const GameModuleListEvent.levelCompleted(
        levelId: 1,
        stars: 1,
        correctAnswers: 1,
        totalQuestions: 3,
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 10));

    final state = bloc.state as ReceiveSuccess;
    expect(state.progressMap[1], oldProgress);

    await bloc.close();
  });
}

class _LevelListRepository implements GameModuleLevelListRepository {
  _LevelListRepository(this.levels);

  final List<GameModuleLevelEntity> levels;

  @override
  Future<List<GameModuleLevelEntity>> getAllLevels() async => levels;

  @override
  Future<GameModuleLevelEntity> getLevelById({required int levelId}) async =>
      levels.firstWhere((level) => level.id == levelId);
}

class _ProgressRepository implements LevelProgressRepository {
  _ProgressRepository(this.progress);

  final Map<int, LevelProgressEntity> progress;
  bool failRefresh = false;

  @override
  Future<Map<int, LevelProgressEntity>> getAllLevelsProgress() async {
    if (failRefresh) throw Exception('network error');
    return progress;
  }

  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async =>
      progress[levelId];

  @override
  Future<bool> isLevelCompleted(int levelId) async =>
      progress[levelId]?.isCompleted ?? false;

  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) async {}
}
