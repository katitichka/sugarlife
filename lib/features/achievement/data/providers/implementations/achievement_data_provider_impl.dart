import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/achievement/data/dtos/achievement_dto.dart';
import 'package:sugarlife/features/achievement/data/providers/achievement_data_provider.dart';

class AchievementDataProviderImpl implements AchievementDataProvider {
  AchievementDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  String? get currentUserId => _api.currentUserId;
  @override
  String resolveImageUrl(String path) => _api.assetUrl(path);

  @override
  Future<AchievementDto?> getAchievementById(int id) async {
    try {
      return AchievementDto.fromJson(
        await _api.get('/achievements/$id') as Map<String, dynamic>,
      );
    } on ApiException catch (error) {
      if (error.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<List<AchievementDto>> getAllAchievements() async =>
      (await _api.get('/achievements') as List)
          .map((row) => AchievementDto.fromJson(row as Map<String, dynamic>))
          .toList();

  @override
  Future<List<int>> getUserAchievementIds(String userId) async =>
      (await _api.get('/me/achievements') as List)
          .map((row) => (row as Map<String, dynamic>)['id'] as int)
          .toList();

  @override
  Future<List<AchievementDto>> getAchievementsByIds(List<int> ids) async {
    if (ids.isEmpty) return [];
    final wanted = ids.toSet();
    return (await getAllAchievements())
        .where((item) => wanted.contains(item.id))
        .toList();
  }

  @override
  Future<void> insertUserAchievement({
    required String userId,
    required int achievementId,
  }) async {
    await _api.post('/me/achievements/$achievementId');
  }

  @override
  Future<bool> hasUserAchievement({
    required String userId,
    required int achievementId,
  }) async => (await getUserAchievementIds(userId)).contains(achievementId);
}
