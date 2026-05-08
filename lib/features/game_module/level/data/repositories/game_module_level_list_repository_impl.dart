import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_level_mapper.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameModuleLevelListRepositoryImpl
    implements GameModuleLevelListRepository {
  final SupabaseClient _supabase;
  final AppCacheService _cache;

  GameModuleLevelListRepositoryImpl(this._supabase, this._cache);

  static int _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    throw FormatException('Expected int-compatible value, got $value');
  }

  @override
  Future<List<GameModuleLevelEntity>> getAllLevels() async {
    final cachedLevels = _cache.levels;
    if (cachedLevels != null) {
      return cachedLevels;
    }

    final response = await _supabase
        .from('levels')
        .select('id, title, order_index, theory_module_id')
        .order('theory_module_id')
        .order('order_index');

    if (response.isEmpty) {
      return [];
    }

    final dtos = response
        .map((row) => GameModuleLevelDto.fromJson(Map<String, dynamic>.from(row)))
        .toList();

    final levelIds = dtos.map((dto) => dto.id).toList();
    final questionCountByLevel = <int, int>{
      for (final id in levelIds) id: 0,
    };

    final questionsResponse = await _supabase
        .from('questions')
        .select('level_id')
        .inFilter('level_id', levelIds);

    for (final row in questionsResponse) {
      final lid = _asInt(row['level_id']);
      questionCountByLevel[lid] = (questionCountByLevel[lid] ?? 0) + 1;
    }

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

    final response = await _supabase
        .from('levels')
        .select('id, title, order_index, theory_module_id')
        .eq('id', levelId)
        .single();

    final questions = await _supabase
        .from('questions')
        .select('id')
        .eq('level_id', levelId);

    final dto = GameModuleLevelDto.fromJson(Map<String, dynamic>.from(response));
    final level = GameModuleLevelMapper.toEntity(
      dto,
      totalQuestions: questions.length,
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
