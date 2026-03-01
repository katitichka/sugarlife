import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class SharedPrefsLevelProgressRepository implements LevelProgressRepository {
  final SharedPreferences _prefs;

  SharedPrefsLevelProgressRepository(this._prefs);

  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async {
    final stars = _prefs.getInt('level_${levelId}_stars');
    if (stars == null) return null;

    return LevelProgressEntity(
      levelId: levelId,
      isCompleted: true,
      stars: stars,
      lastPlayedAt: DateTime.fromMillisecondsSinceEpoch(
        _prefs.getInt('level_${levelId}_time') ?? 0,
      ),
      correctAnswers: _prefs.getInt('level_${levelId}_correct') ?? 0,
    );
  }

  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) async {
    await _prefs.setInt('level_${levelId}_stars', stars);
    await _prefs.setInt(
      'level_${levelId}_time',
      DateTime.now().millisecondsSinceEpoch,
    );
    await _prefs.setInt('level_${levelId}_correct', correctAnswers);
  }

  @override
  Future<bool> isLevelCompleted(int levelId) async {
    return _prefs.containsKey('level_${levelId}_stars');
  }

  @override
  Future<void> resetLevelProgress(int levelId) async {
    await _prefs.remove('level_${levelId}_stars');
    await _prefs.remove('level_${levelId}_time');
    await _prefs.remove('level_${levelId}_correct');
  }

  @override
  Future<Map<int, LevelProgressEntity>> getAllLevelsProgress() async {
    Map<int, LevelProgressEntity> allUnblockLevels = {};
    Set<String> keys = _prefs.getKeys();
    for (String key in keys) {
      if (key.startsWith('level_') && key.endsWith('_stars')) {
        int levelId = int.parse(key.split('_')[1]);
        int? stars = _prefs.getInt('level_${levelId}_stars');
        int? correctAnswers = _prefs.getInt('level_${levelId}_correct');
        int? timeCompleted = _prefs.getInt('level_${levelId}_time');

        if (stars != null) {
          allUnblockLevels[levelId] = LevelProgressEntity(
            levelId: levelId,
            isCompleted: stars >= 1,
            stars: stars,
            lastPlayedAt: timeCompleted != null
                ? DateTime.fromMicrosecondsSinceEpoch(timeCompleted)
                : null,
            correctAnswers: correctAnswers ?? 0,
          );
        }
      }
    }
    return allUnblockLevels;
  }
}
