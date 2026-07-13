import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';

abstract interface class AchievementRepository {
  Future<List<AchievementEntity>> getUserAchievements();
  Future<AchievementEntity?> unlockRandomAchievement({required AchievementType type});
  Future<AchievementEntity?> getPendingAchievement();
  Future<void> markAchievementCardShown({required int achievementId});
}
