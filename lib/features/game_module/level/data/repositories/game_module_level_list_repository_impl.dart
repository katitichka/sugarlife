import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_level_mapper.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_list_data_provider.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';

class GameModuleLevelListRepositoryImpl
    implements GameModuleLevelListRepository {
  final GameModuleLevelListDataProvider _dataProvider;
  final AppCacheService _cache;

  GameModuleLevelListRepositoryImpl(this._dataProvider, this._cache);

  @override
  Future<List<GameModuleLevelEntity>> getAllLevels() async {
    final cachedLevels = _cache.levels;
    if (cachedLevels != null) {
      return cachedLevels;
    }

    final dtos = await _dataProvider.getLevels();

    if (dtos.isEmpty) {
      return [];
    }

    final levelIds = dtos.map((dto) => dto.id).toList();
    final questionCountByLevel = await _dataProvider.getQuestionCountsByLevel(
      levelIds,
    );

    final levels = GameModuleLevelMapper.toEntityList(dtos, questionCountByLevel);

    _cache.saveLevels(levels);
    return levels;
  }

  @override
  Future<GameModuleLevelEntity> getLevelById({required int levelId}) async {
    final cachedLevel = _cache.levels?.cast<GameModuleLevelEntity?>().firstWhere(
      (level) => level?.id == levelId,
      orElse: () => null,
    );
    if (cachedLevel != null) {
      return cachedLevel;
    }

    final dto = await _dataProvider.getLevelById(levelId);
    final totalQuestions = await _dataProvider.getQuestionsCountForLevel(
      levelId,
    );

    final level = GameModuleLevelMapper.toEntity(
      dto,
      totalQuestions: totalQuestions,
    );

    final cachedLevels = List<GameModuleLevelEntity>.from(_cache.levels ?? []);
    final existingIndex = cachedLevels.indexWhere((item) => item.id == level.id);
    if (existingIndex == -1) {
      cachedLevels.add(level);
    } else {
      cachedLevels[existingIndex] = level;
    }
    cachedLevels.sort((a, b) {
      final byTheory = a.theoryModuleId.compareTo(b.theoryModuleId);
      if (byTheory != 0) return byTheory;
      return a.orderIndex.compareTo(b.orderIndex);
    });
    _cache.saveLevels(cachedLevels);

    return level;
  }
}
