import 'package:sugarlife/features/game_module/level/data/dtos/character_dto.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';

abstract class GameModuleLevelDataProvider {
  Future<List<GameModuleQuestionDto>> getQuestionsForLevel({
    required int levelId,
  });

  Future<CharacterDto?> getCharacterById(int characterId);

  Future<List<CharacterDto>> getCharactersByIds(List<int> ids);

  String resolveCharacterImageUrl(String path);
}
