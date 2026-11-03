import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/character_dto.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_data_provider.dart';

class GameModuleLevelDataProviderImpl implements GameModuleLevelDataProvider {
  GameModuleLevelDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  Future<List<GameModuleQuestionDto>> getQuestionsForLevel({
    required int levelId,
  }) async => (await _api.get('/levels/$levelId/questions') as List)
      .map((row) => GameModuleQuestionDto.fromJson(row as Map<String, dynamic>))
      .toList();

  @override
  Future<CharacterDto?> getCharacterById(int characterId) async {
    try {
      return CharacterDto.fromJson(
        await _api.get('/characters/$characterId') as Map<String, dynamic>,
      );
    } on ApiException catch (error) {
      if (error.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<List<CharacterDto>> getCharactersByIds(List<int> ids) async {
    if (ids.isEmpty) return [];
    final wanted = ids.toSet();
    return (await _api.get('/characters') as List)
        .map((row) => CharacterDto.fromJson(row as Map<String, dynamic>))
        .where((character) => wanted.contains(character.id))
        .toList();
  }

  @override
  String resolveCharacterImageUrl(String path) => _api.assetUrl(path);
}
