import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/achievement/data/dtos/achievement_dto.dart';
import 'package:sugarlife/features/achievement/data/providers/achievement_data_provider.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  AchievementRepositoryImpl(this._dataProvider, this._cache);

  final AchievementDataProvider _dataProvider;
  final AppCacheService _cache;

  static const String _shownAchievementsKey = 'shown_achievement_ids';
  static const String _pendingAchievementKey = 'pending_achievement_id';
  static const String _moduleAchievementsKey = 'module_achievement_granted_ids';

  AchievementEntity _mapAchievement(AchievementDto dto) {
    return AchievementEntity(
      id: dto.id,
      name: dto.name.trim(),
      description: dto.description.trim(),
      imageUrl: _resolveimageUrl(dto.imageUrl.trim()),
    );
  }

  String _resolveimageUrl(String raw) {
    if (raw.isEmpty) {
      return raw;
    }
    if (raw.startsWith('http://') || raw.startsWith('https://')) {
      return raw;
    }
    final path = raw.startsWith('/') ? raw.substring(1) : raw;
    return _dataProvider.resolveImageUrl(path);
  }

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  Future<Set<int>> _getShownAchievementIds() async {
    final prefs = await _prefs;
    final values = prefs.getStringList(_shownAchievementsKey) ?? const [];
    return values.map(int.parse).toSet();
  }

  Future<void> _setShownAchievementIds(Set<int> ids) async {
    final prefs = await _prefs;
    await prefs.setStringList(
      _shownAchievementsKey,
      ids.map((value) => value.toString()).toList(),
    );
  }

  Future<AchievementEntity?> _getAchievementById(int id) async {
    final cached = _cache.achievementsById[id];
    if (cached != null) {
      return cached;
    }

    final dto = await _dataProvider.getAchievementById(id);
    if (dto == null) {
      return null;
    }

    final achievement = _mapAchievement(dto);
    _cache.saveAchievement(achievement);
    return achievement;
  }

  @override
  Future<List<AchievementEntity>> getUserAchievements() async {
    final cached = _cache.achievements;
    if (cached != null) {
      return cached;
    }

    final userId = _dataProvider.currentUserId;
    if (userId == null) {
      return const [];
    }

    final achievementIds = await _dataProvider.getUserAchievementIds(userId);
    if (achievementIds.isEmpty) {
      _cache.saveAchievements(const []);
      return const [];
    }

    final achievementsResponse = await _dataProvider.getAchievementsByIds(
      achievementIds,
    );

    final achievements = achievementsResponse.map(_mapAchievement).toList();
    _cache.saveAchievements(achievements);
    return achievements;
  }

  @override
  Future<AchievementEntity?> unlockRandomAchievement() async {
    final userId = _dataProvider.currentUserId;
    if (userId == null) {
      return null;
    }

    final allAchievementsResponse = await _dataProvider.getAllAchievements();

    final allAchievements = allAchievementsResponse.map(_mapAchievement).toList();

    if (allAchievements.isEmpty) {
      return null;
    }

    final userAchievements = await getUserAchievements();
    final unlockedIds = userAchievements.map((a) => a.id).toSet();

    final available = allAchievements
        .where((a) => !unlockedIds.contains(a.id))
        .toList();

    if (available.isEmpty) {
      return null;
    }

    final randomIndex = DateTime.now().millisecondsSinceEpoch % available.length;
    final achievement = available[randomIndex];

    try {
      await _dataProvider.insertUserAchievement(
        userId: userId,
        achievementId: achievement.id,
      );
    } catch (e) {
      final hasRelation = await _dataProvider.hasUserAchievement(
        userId: userId,
        achievementId: achievement.id,
      );
      if (!hasRelation) {
        print('Ошибка вставки: $e');
        return null;
      }
    }

    final prefs = await _prefs;
    await prefs.setInt(_pendingAchievementKey, achievement.id);

    final cached = List<AchievementEntity>.from(
      _cache.achievements ?? const [],
    );
    cached.removeWhere((item) => item.id == achievement.id);
    cached.add(achievement);
    cached.sort((a, b) => a.id.compareTo(b.id));
    _cache.saveAchievements(cached);

    return achievement;
  }

  @override
  Future<AchievementEntity?> getPendingAchievement() async {
    final prefs = await _prefs;
    final pendingId = prefs.getInt(_pendingAchievementKey);
    if (pendingId == null) {
      return null;
    }

    final shownIds = await _getShownAchievementIds();
    if (shownIds.contains(pendingId)) {
      await prefs.remove(_pendingAchievementKey);
      return null;
    }

    return _getAchievementById(pendingId);
  }

  @override
  Future<void> markAchievementCardShown({required int achievementId}) async {
    final shownIds = await _getShownAchievementIds();
    shownIds.add(achievementId);
    await _setShownAchievementIds(shownIds);

    final prefs = await _prefs;
    final pendingId = prefs.getInt(_pendingAchievementKey);
    if (pendingId == achievementId) {
      await prefs.remove(_pendingAchievementKey);
    }
  }

  @override
  Future<bool> isModuleAchievementGranted(int theoryModuleId) async {
    final prefs = await _prefs;
    final values = prefs.getStringList(_moduleAchievementsKey) ?? const [];
    return values.contains(theoryModuleId.toString());
  }

  @override
  Future<void> markModuleAchievementGranted(int theoryModuleId) async {
    final prefs = await _prefs;
    final values = List<String>.from(
      prefs.getStringList(_moduleAchievementsKey) ?? const [],
    );
    if (!values.contains(theoryModuleId.toString())) {
      values.add(theoryModuleId.toString());
      await prefs.setStringList(_moduleAchievementsKey, values);
    }
  }
}
