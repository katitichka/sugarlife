import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

class AppCacheService {
  List<GameModuleLevelEntity>? _levels;
  final Map<int, List<GameModuleQuestionEntity>> _questionsByLevel = {};
  List<TheoryModuleEntity>? _theoryModules;
  final Map<int, TheoryModuleEntity> _theoryModuleById = {};
  List<AvatarEntity>? _avatars;
  List<AchievementEntity>? _achievements;
  final Map<int, AchievementEntity> _achievementsById = {};

  List<GameModuleLevelEntity>? get levels => _levels;
  List<TheoryModuleEntity>? get theoryModules => _theoryModules;
  List<AvatarEntity>? get avatars => _avatars;
  List<AchievementEntity>? get achievements => _achievements;
  Map<int, AchievementEntity> get achievementsById =>
      Map.unmodifiable(_achievementsById);

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

  void saveAchievements(List<AchievementEntity> achievements) {
    _achievements = List.unmodifiable(achievements);
    _achievementsById
      ..clear()
      ..addEntries(achievements.map((item) => MapEntry(item.id, item)));
  }

  void saveAchievement(AchievementEntity achievement) {
    _achievementsById[achievement.id] = achievement;

    if (_achievements == null) {
      _achievements = List.unmodifiable([achievement]);
      return;
    }

    final achievements = List<AchievementEntity>.from(_achievements!);
    final index = achievements.indexWhere((item) => item.id == achievement.id);
    if (index == -1) {
      achievements.add(achievement);
    } else {
      achievements[index] = achievement;
    }
    achievements.sort((a, b) => a.id.compareTo(b.id));
    _achievements = List.unmodifiable(achievements);
  }

  Future<void> clearAll()async  {
    _levels = null;
    _questionsByLevel.clear();
    _theoryModules = null;
    _theoryModuleById.clear();
    _avatars = null;
    _achievements = null;
    _achievementsById.clear();
    final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  }
}
