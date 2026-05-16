import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  AchievementRepositoryImpl(this._supabase, this._cache);

  final SupabaseClient _supabase;
  final AppCacheService _cache;

  static const String _shownAchievementsKey = 'shown_achievement_ids';
  static const String _pendingAchievementKey = 'pending_achievement_id';
  static const String _achievementsBucket = 'achievements';

  AchievementEntity _mapAchievement(Map<String, dynamic> json) {
    return AchievementEntity(
      id: _asInt(json['id']),
      name: (json['name'] as String? ?? '').trim(),
      description: (json['description'] as String? ?? '').trim(),
      imageUrl: _resolveimageUrl((json['image_url'] as String? ?? '').trim()),
    );
  }

  int _asInt(Object? value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    throw FormatException('Expected int-compatible value, got $value');
  }

  String _resolveimageUrl(String raw) {
    if (raw.isEmpty) {
      return raw;
    }
    if (raw.startsWith('http://') || raw.startsWith('https://')) {
      return raw;
    }
    final path = raw.startsWith('/') ? raw.substring(1) : raw;
    return _supabase.storage.from(_achievementsBucket).getPublicUrl(path);
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

    final response = await _supabase
        .from('achievements')
        .select('id, module_id, name, description, image_url')
        .eq('id', id)
        .maybeSingle();
    if (response == null) {
      return null;
    }

    final achievement = _mapAchievement(Map<String, dynamic>.from(response));
    _cache.saveAchievement(achievement);
    return achievement;
  }

  @override
  Future<List<AchievementEntity>> getUserAchievements() async {
    final cached = _cache.achievements;
    if (cached != null) {
      return cached;
    }

    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      return const [];
    }

    final relations = await _supabase
        .from('user_achievement')
        .select('achievement_id')
        .eq('user_id', userId);
    if (relations.isEmpty) {
      _cache.saveAchievements(const []);
      return const [];
    }

    final achievementIds = relations
        .map((row) => _asInt(row['achievement_id']))
        .toList();

    final achievementsResponse = await _supabase
        .from('achievements')
        .select('id, module_id, name, description, image_url')
        .inFilter('id', achievementIds)
        .order('id');

    final achievements = achievementsResponse
        .map((row) => _mapAchievement(Map<String, dynamic>.from(row)))
        .toList();
    _cache.saveAchievements(achievements);
    return achievements;
  }

  @override
Future<AchievementEntity?> unlockRandomAchievement() async {
  final userId = _supabase.auth.currentUser?.id;
  if (userId == null) {
    return null;
  }

  final allAchievementsResponse = await _supabase
      .from('achievements')
      .select('id, module_id, name, description, image_url');

  final allAchievements = allAchievementsResponse
      .map((row) => _mapAchievement(Map<String, dynamic>.from(row)))
      .toList();

  if (allAchievements.isEmpty) {
    print('Нет достижений в БД');
    return null;
  }
  
  final userAchievements = await getUserAchievements();
  final unlockedIds = userAchievements.map((a) => a.id).toSet();
  
  final available = allAchievements
      .where((a) => !unlockedIds.contains(a.id))
      .toList();
      
  if (available.isEmpty) {
    print('Все достижения уже получены');
    return null;
  }

  final randomIndex = DateTime.now().millisecondsSinceEpoch % available.length;
  final achievement = available[randomIndex];

  // Сохраняем в БД с обработкой ошибок
  try {
    await _supabase.from('user_achievement').insert({
      'user_id': userId,
      'achievement_id': achievement.id,
    });
  } catch (e) {
    // Проверяем, возможно запись уже есть (дубль)
    final relationAfterFailure = await _supabase
        .from('user_achievement')
        .select('achievement_id')
        .eq('user_id', userId)
        .eq('achievement_id', achievement.id)
        .maybeSingle();
    if (relationAfterFailure == null) {
      rethrow;
    }
    print('INSERT вернул ошибку ($e), но запись уже есть в БД');
  }
  
  print('Выдано достижение ${achievement.id}: ${achievement.name}');

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
}
