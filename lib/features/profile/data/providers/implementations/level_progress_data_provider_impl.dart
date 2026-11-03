import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/profile/data/DTOs/level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/DTOs/save_level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/providers/level_progress_data_provider.dart';

class LevelProgressDataProviderImpl implements LevelProgressDataProvider {
  LevelProgressDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  String get currentUserId =>
      _api.currentUserId ??
      (throw StateError('Нет авторизованного пользователя'));

  @override
  Future<LevelProgressDto?> getLevelProgress({
    required String userId,
    required int levelId,
  }) async {
    try {
      return LevelProgressDto.fromJson(
        await _api.get('/me/progress/$levelId') as Map<String, dynamic>,
      );
    } on ApiException catch (error) {
      if (error.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<void> _save(SaveLevelProgressDto progress) async {
    await _api.put('/me/progress/${progress.levelId}', {
      'stars': progress.stars,
      'correct_answers': progress.correctAnswers,
    });
  }

  @override
  Future<void> insertLevelProgress(SaveLevelProgressDto progress) =>
      _save(progress);
  @override
  Future<void> updateLevelProgress(SaveLevelProgressDto progress) =>
      _save(progress);

  @override
  Future<List<LevelProgressDto>> getAllLevelsProgress({
    required String userId,
  }) async => (await _api.get('/me/progress') as List)
      .map((row) => LevelProgressDto.fromJson(row as Map<String, Object?>))
      .toList();
}
