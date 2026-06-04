import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_question_supabase_mapper.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameModuleLevelRepositoryImpl implements GameModuleLevelRepository {
  GameModuleLevelRepositoryImpl(this._supabase, this._cache);

  final SupabaseClient _supabase;
  final AppCacheService _cache;
  static const String _charactersBucket = 'characters';

   String _publicSvgUrl(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return t;
    if (t.startsWith('http://') || t.startsWith('https://')) {
      return t;
    }
    var path = t.startsWith('/') ? t.substring(1) : t;
    final bucketPrefix = '$_charactersBucket/';
    if (path.toLowerCase().startsWith(bucketPrefix)) {
      path = path.substring(bucketPrefix.length);
    }
    return _supabase.storage.from(_charactersBucket).getPublicUrl(path);
  }
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
  Future<String?> getCharacterImageUrl(int characterId) async {
    final response = await _supabase
        .from('characters')
        .select('image_url')
        .eq('id', characterId)
        .maybeSingle();
    final imageUrl = response?['image_url'] as String?;
    if (imageUrl == null) return null;

    return _supabase.storage.from('characters').getPublicUrl(imageUrl);
  }

  @override
  Future<Map<int, String>> getCharacterImagesForLevel({required int levelId}) async {
    final questions = await getQuestionsForLevel(levelId: levelId);

    final characterIds = questions
        .map((q) => q.characterId)
        .whereType<int>()
        .toSet()
        .toList();

    if (characterIds.isEmpty) return {};

    final response = await _supabase
        .from('characters')
        .select('id, image_url')
        .inFilter('id', characterIds);

    return {
      for (final row in response)
        row['id'] as int: _publicSvgUrl(row['image_url'] as String),
    };
  }
}
