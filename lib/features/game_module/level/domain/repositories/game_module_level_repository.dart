import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';

abstract interface class GameModuleLevelRepository {
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
  });
  Future<String?> getCharacterImageUrl(int characterId);
  Future<Map<int, String>> getCharacterImagesForLevel({
    required int levelId,
  });
}
