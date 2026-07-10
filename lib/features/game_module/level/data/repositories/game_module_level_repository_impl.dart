import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_question_supabase_mapper.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_data_provider.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';

class GameModuleLevelRepositoryImpl implements GameModuleLevelRepository {
  GameModuleLevelRepositoryImpl(this._dataProvider, this._cache);

  final GameModuleLevelDataProvider _dataProvider;
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
    return _dataProvider.resolveCharacterImageUrl(path);
  }

  @override
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
  }) async {
    final cachedQuestions = _cache.getQuestionsForLevel(levelId);
    if (cachedQuestions != null) {
      return cachedQuestions;
    }

    final dtos = await _dataProvider.getQuestionsForLevel(levelId: levelId);
    final questions = dtos
        .map(GameModuleQuestionSupabaseMapper.toEntity)
        .toList();

    _cache.saveQuestionsForLevel(levelId, questions);
    return questions;
  }

  @override
  Future<String?> getCharacterImageUrl(int characterId) async {
    final character = await _dataProvider.getCharacterById(characterId);
    if (character == null) return null;

    return _dataProvider.resolveCharacterImageUrl(character.imageUrl);
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

    final characters = await _dataProvider.getCharactersByIds(characterIds);

    return {
      for (final character in characters)
        character.id: _publicSvgUrl(character.imageUrl),
    };
  }
}
