import 'package:sugarlife/features/profile/data/DTOs/level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/DTOs/save_level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/providers/level_progress_data_provider.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class LevelProgressRepositoryImpl implements LevelProgressRepository {
  final LevelProgressDataProvider _dataProvider;
  LevelProgressRepositoryImpl(this._dataProvider);

  LevelProgressEntity _mapEntity(LevelProgressDto dto) {
    return LevelProgressEntity(
      levelId: dto.levelId,
      isCompleted: dto.stars != null,
      stars: dto.stars,
      lastPlayedAt: dto.completedAt != null ? DateTime.parse(dto.completedAt!) : null,
      correctAnswers: dto.correctAnswers ?? 0,
    );
  }

  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async {
    final userId = _dataProvider.currentUserId;
    final dto = await _dataProvider.getLevelProgress(
      userId: userId,
      levelId: levelId,
    );
    return dto == null ? null : _mapEntity(dto);
  }

  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) async {
    final userId = _dataProvider.currentUserId;
    final existing = await _dataProvider.getLevelProgress(
      userId: userId,
      levelId: levelId,
    );
    final completedAt = DateTime.now().toIso8601String();
    if (existing == null) {
      await _dataProvider.insertLevelProgress(
        SaveLevelProgressDto(
          userId: userId,
          levelId: levelId,
          stars: stars,
          correctAnswers: correctAnswers,
          completedAt: completedAt,
        ),
      );
    } else {
      final oldStars = existing.stars ?? 0;
      if (stars > oldStars) {
        await _dataProvider.updateLevelProgress(
          SaveLevelProgressDto(
            userId: userId,
            levelId: levelId,
            stars: stars,
            correctAnswers: correctAnswers,
            completedAt: completedAt,
          ),
        );
      }
    }
  }

  @override
  Future<bool> isLevelCompleted(int levelId) async {
    final userId = _dataProvider.currentUserId;
    final existing = await _dataProvider.getLevelProgress(
      userId: userId,
      levelId: levelId,
    );
    if (existing == null) {
      return false;
    }
    return existing.stars != null;
  }

  @override
  Future<Map<int, LevelProgressEntity>> getAllLevelsProgress() async {
    final userId = _dataProvider.currentUserId;
    final dtos = await _dataProvider.getAllLevelsProgress(userId: userId);
    final Map<int, LevelProgressEntity> result = {};
    for (final dto in dtos) {
      result[dto.levelId] = _mapEntity(dto);
    }
    return result;
  }
}
