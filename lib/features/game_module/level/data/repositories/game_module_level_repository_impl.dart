import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';
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
          'id, question, question_type, answers, explanation, order_index, level_id, correct_answer, character_id',
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

  @override
  Future<String?> getCharacterImageUrl(int characterId) {
    return loadWithRetry(() => _fetchCharacterImageUrl(characterId));
  }

  Future<String?> _fetchCharacterImageUrl(int characterId) async {
    final response = await _supabase
        .from('characters')
        .select('image_url')
        .eq('id', characterId)
        .maybeSingle();
    final imageUrl = response?['image_url'] as String?;
    if (imageUrl == null) return null;

    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    final path = imageUrl.startsWith('/') ? imageUrl.substring(1) : imageUrl;
    return _supabase.storage.from('characters').getPublicUrl(path);
  }
}
