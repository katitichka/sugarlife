import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

class AppCacheService {
  static const _allAchievementsKey = 'cached_all_achievements';
  static const _userAchievementsKey = 'cached_user_achievements';

  List<GameModuleLevelEntity>? _levels;
  final Map<int, List<GameModuleQuestionEntity>> _questionsByLevel = {};
  List<TheoryModuleEntity>? _theoryModules;
  final Map<int, TheoryModuleEntity> _theoryModuleById = {};
  List<AvatarEntity>? _avatars;
  List<AchievementEntity>? _allAchievements;
  List<AchievementEntity>? _userAchievements;
  String? _achievementUserId;
  final Map<int, AchievementEntity> _achievementsById = {};
  _DailyCardCache? _dailyCardCache;

  List<GameModuleLevelEntity>? get levels => _levels;
  List<TheoryModuleEntity>? get theoryModules => _theoryModules;
  List<AvatarEntity>? get avatars => _avatars;
  Map<int, AchievementEntity> get achievementsById =>
      Map.unmodifiable(_achievementsById);

  bool hasCachedDailyCard({required String userId, required DateTime date}) {
    final cache = _dailyCardCache;
    return cache != null &&
        cache.matches(userId: userId, date: date) &&
        cache.isCardLoaded;
  }

  DailyCardEntity? getCachedDailyCard({
    required String userId,
    required DateTime date,
  }) {
    final cache = _dailyCardCache;
    if (cache == null || !cache.matches(userId: userId, date: date)) {
      return null;
    }
    return cache.card;
  }

  bool hasCachedDailyCardAnswer({
    required String userId,
    required DateTime date,
  }) {
    final cache = _dailyCardCache;
    return cache != null &&
        cache.matches(userId: userId, date: date) &&
        cache.isAnswerLoaded;
  }

  AnsweredDailyCardEntity? getCachedDailyCardAnswer({
    required String userId,
    required DateTime date,
  }) {
    final cache = _dailyCardCache;
    if (cache == null || !cache.matches(userId: userId, date: date)) {
      return null;
    }
    return cache.answer;
  }

  List<GameModuleQuestionEntity>? getQuestionsForLevel(int levelId) {
    return _questionsByLevel[levelId];
  }

  TheoryModuleEntity? getTheoryModuleById(int id) {
    return _theoryModuleById[id];
  }

  void saveLevels(List<GameModuleLevelEntity> levels) {
    _levels = List.unmodifiable(levels);
  }

  void saveQuestionsForLevel(
    int levelId,
    List<GameModuleQuestionEntity> questions,
  ) {
    _questionsByLevel[levelId] = List.unmodifiable(questions);
  }

  void saveTheoryModules(List<TheoryModuleEntity> modules) {
    _theoryModules = List.unmodifiable(modules);
    for (final module in modules) {
      _theoryModuleById[module.id] = module;
    }
  }

  void saveTheoryModule(TheoryModuleEntity module) {
    _theoryModuleById[module.id] = module;

    if (_theoryModules == null) {
      _theoryModules = List.unmodifiable([module]);
      return;
    }

    final modules = List<TheoryModuleEntity>.from(_theoryModules!);
    final index = modules.indexWhere((item) => item.id == module.id);
    if (index == -1) {
      modules.add(module);
    } else {
      modules[index] = module;
    }
    modules.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    _theoryModules = List.unmodifiable(modules);
  }

  void saveAvatars(List<AvatarEntity> avatars) {
    _avatars = List.unmodifiable(avatars);
  }

  Future<List<AchievementEntity>?> getAllAchievements() async {
    if (_allAchievements != null) return _allAchievements;

    final prefs = await SharedPreferences.getInstance();
    final cached = _decodeAchievements(prefs.getString(_allAchievementsKey));
    if (cached == null) return null;

    _allAchievements = List.unmodifiable(cached);
    _indexAchievements(cached);
    return _allAchievements;
  }

  Future<void> saveAllAchievements(List<AchievementEntity> achievements) async {
    _allAchievements = List.unmodifiable(achievements);
    _indexAchievements(achievements, overwrite: false);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _allAchievementsKey,
      jsonEncode(achievements.map(_achievementToJson).toList()),
    );
  }

  Future<List<AchievementEntity>?> getUserAchievements(String userId) async {
    if (_achievementUserId == userId && _userAchievements != null) {
      return _userAchievements;
    }

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userAchievementsKey);
    if (raw == null) return null;

    try {
      final payload = jsonDecode(raw) as Map<String, dynamic>;
      if (payload['userId'] != userId) return null;
      final cached = _decodeAchievementList(payload['items']);
      _achievementUserId = userId;
      _userAchievements = List.unmodifiable(cached);
      _indexAchievements(cached);
      return _userAchievements;
    } catch (_) {
      return null;
    }
  }

  Future<void> saveUserAchievements({
    required String userId,
    required List<AchievementEntity> achievements,
  }) async {
    _achievementUserId = userId;
    _userAchievements = List.unmodifiable(achievements);
    _indexAchievements(achievements);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userAchievementsKey,
      jsonEncode({
        'userId': userId,
        'items': achievements.map(_achievementToJson).toList(),
      }),
    );
  }

  Future<void> saveUserAchievement({
    required String userId,
    required AchievementEntity achievement,
  }) async {
    final cached = await getUserAchievements(userId) ?? const [];
    final achievements = List<AchievementEntity>.from(cached);

    final index = achievements.indexWhere((item) => item.id == achievement.id);
    if (index == -1) {
      achievements.add(achievement);
    } else {
      achievements[index] = achievement;
    }
    achievements.sort((a, b) => a.id.compareTo(b.id));
    await saveUserAchievements(userId: userId, achievements: achievements);
  }

  void _indexAchievements(
    List<AchievementEntity> achievements, {
    bool overwrite = true,
  }) {
    for (final achievement in achievements) {
      if (overwrite) {
        _achievementsById[achievement.id] = achievement;
      } else {
        _achievementsById.putIfAbsent(achievement.id, () => achievement);
      }
    }
  }

  List<AchievementEntity>? _decodeAchievements(String? raw) {
    if (raw == null) return null;
    try {
      return _decodeAchievementList(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  List<AchievementEntity> _decodeAchievementList(Object? value) {
    final items = value as List<dynamic>;
    return items
        .map((item) => _achievementFromJson(item as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> _achievementToJson(AchievementEntity achievement) {
    return {
      'id': achievement.id,
      'name': achievement.name,
      'description': achievement.description,
      'imageUrl': achievement.imageUrl,
      'type': achievement.type.value,
      'isUnlocked': achievement.isUnlocked,
    };
  }

  AchievementEntity _achievementFromJson(Map<String, dynamic> json) {
    return AchievementEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      type: AchievementType.fromString(json['type'] as String),
      isUnlocked: json['isUnlocked'] as bool? ?? false,
    );
  }

  void saveDailyCard({
    required String userId,
    required DateTime date,
    required DailyCardEntity? card,
  }) {
    final cache = _dailyCardCacheFor(userId: userId, date: date);
    cache
      ..isCardLoaded = true
      ..card = card;
  }

  void saveDailyCardAnswer({
    required String userId,
    required DateTime date,
    required AnsweredDailyCardEntity? answer,
  }) {
    final cache = _dailyCardCacheFor(userId: userId, date: date);
    cache
      ..isAnswerLoaded = true
      ..answer = answer;

    if (answer != null) {
      cache
        ..isCardLoaded = true
        ..card = answer.card;
    }
  }

  _DailyCardCache _dailyCardCacheFor({
    required String userId,
    required DateTime date,
  }) {
    final cache = _dailyCardCache;
    if (cache != null && cache.matches(userId: userId, date: date)) {
      return cache;
    }

    return _dailyCardCache = _DailyCardCache(userId: userId, date: date);
  }

  Future<void> clearAll() async {
    _levels = null;
    _questionsByLevel.clear();
    _theoryModules = null;
    _theoryModuleById.clear();
    _avatars = null;
    _allAchievements = null;
    _userAchievements = null;
    _achievementUserId = null;
    _achievementsById.clear();
    _dailyCardCache = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

class _DailyCardCache {
  final String userId;
  final DateTime date;
  bool isCardLoaded = false;
  bool isAnswerLoaded = false;
  DailyCardEntity? card;
  AnsweredDailyCardEntity? answer;

  _DailyCardCache({required this.userId, required this.date});

  bool matches({required String userId, required DateTime date}) {
    return this.userId == userId && this.date == date;
  }
}
