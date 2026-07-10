import 'package:sugarlife/features/achievement/data/dtos/achievement_dto.dart';

abstract class AchievementDataProvider {
  String? get currentUserId;

  String resolveImageUrl(String path);

  Future<AchievementDto?> getAchievementById(int id);

  Future<List<AchievementDto>> getAllAchievements();

  Future<List<int>> getUserAchievementIds(String userId);

  Future<List<AchievementDto>> getAchievementsByIds(List<int> ids);

  Future<void> insertUserAchievement({
    required String userId,
    required int achievementId,
  });

  Future<bool> hasUserAchievement({
    required String userId,
    required int achievementId,
  });
}
