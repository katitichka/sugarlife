import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';

abstract class GameModuleLevelListDataProvider {
  Future<List<GameModuleLevelDto>> getLevels();

  Future<GameModuleLevelDto> getLevelById(int levelId);

  Future<Map<int, int>> getQuestionCountsByLevel(List<int> levelIds);

  Future<int> getQuestionsCountForLevel(int levelId);
}
