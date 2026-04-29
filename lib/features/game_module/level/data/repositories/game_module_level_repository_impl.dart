import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_question_supabase_mapper.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameModuleLevelRepositoryImpl implements GameModuleLevelRepository {
  GameModuleLevelRepositoryImpl(this._supabase, this._cache);

  final SupabaseClient _supabase;
  final AppCacheService _cache;

  @override
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
  }) async {
    final cachedQuestions = _cache.getQuestionsForLevel(levelId);
    if (cachedQuestions != null) {
      return cachedQuestions;
    }

    final response = await _supabase
        .from('questions')
        .select(
          'id, question, question_type, answers, explanation, order_index, level_id, correct_answer',
        )
        .eq('level_id', levelId)
        .order('order_index', ascending: true);

    final rows = response as List<dynamic>;
    final questions = rows
        .map(
          (e) => GameModuleQuestionSupabaseMapper.toEntity(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();

    _cache.saveQuestionsForLevel(levelId, questions);
    return questions;
  }
}
