import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';

abstract interface class AchievementRepository {
  Future<List<AchievementEntity>> getUserAchievements();
  Future<AchievementEntity?> unlockRandomAchievement();
  Future<AchievementEntity?> getPendingAchievement();
  Future<void> markAchievementCardShown({required int achievementId});
  Future<bool> isModuleAchievementGranted(int moduleId);
Future<void> markModuleAchievementGranted(int moduleId);
}
