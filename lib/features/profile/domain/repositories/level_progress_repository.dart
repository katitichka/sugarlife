import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';

abstract interface class LevelProgressRepository {
  Future<LevelProgressEntity?> getLevelProgress({required int levelId});
  Future<void> saveLevelProgress({required int levelId, required int stars});
  Future<bool> isLevelCompleted(int levelId);
  Future<void> resetLevelProgress(int levelId);
}
