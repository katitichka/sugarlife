import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

class AppCacheService {
  List<GameModuleLevelEntity>? _levels;
  final Map<int, List<GameModuleQuestionEntity>> _questionsByLevel = {};
  List<TheoryModuleEntity>? _theoryModules;
  final Map<int, TheoryModuleEntity> _theoryModuleById = {};
  List<CharacterEntity>? _characters;

  List<GameModuleLevelEntity>? get levels => _levels;
  List<TheoryModuleEntity>? get theoryModules => _theoryModules;
  List<CharacterEntity>? get characters => _characters;

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

  void saveCharacters(List<CharacterEntity> characters) {
    _characters = List.unmodifiable(characters);
  }

  void clearAll() {
    _levels = null;
    _questionsByLevel.clear();
    _theoryModules = null;
    _theoryModuleById.clear();
    _characters = null;
  }
}
