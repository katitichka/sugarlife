import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class MockLevelProgressRepository implements LevelProgressRepository {
  final Map<int, LevelProgressEntity> _storage = {};
  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async {
    return Future.value(_storage[levelId]);
  }

  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
  }) async {
    _storage[levelId] = LevelProgressEntity(
      levelId: levelId,
      isCompleted: true,
      stars: stars,
      lastPlayedAt: DateTime.now(),
    );
  }

  @override
  Future<bool> isLevelCompleted(int levelId) async {
    final progress = _storage[levelId];
    return progress?.isCompleted ?? false;
  }

  @override
  Future<void> resetLevelProgress(int levelId) async {
    _storage.remove(levelId);
  }
}
