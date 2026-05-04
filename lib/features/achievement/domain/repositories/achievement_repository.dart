import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';

abstract interface class AchievementRepository {
  Future<List<AchievementEntity>> getUserAchievements();
  Future<AchievementEntity?> tryUnlockAchievementForModule({
    required int theoryModuleId,
  });
  Future<AchievementEntity?> getPendingAchievement();
  Future<void> markAchievementCardShown({required int achievementId});
}
