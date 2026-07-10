import 'package:sugarlife/features/profile/data/DTOs/level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/DTOs/save_level_progress_dto.dart';

abstract class LevelProgressDataProvider {
  String get currentUserId;

  Future<LevelProgressDto?> getLevelProgress({
    required String userId,
    required int levelId,
  });

  Future<void> insertLevelProgress(SaveLevelProgressDto progress);

  Future<void> updateLevelProgress(SaveLevelProgressDto progress);

  Future<List<LevelProgressDto>> getAllLevelsProgress({
    required String userId,
  });
}
