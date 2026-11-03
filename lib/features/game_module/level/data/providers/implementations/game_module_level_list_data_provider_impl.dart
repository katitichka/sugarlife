import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_list_data_provider.dart';

class GameModuleLevelListDataProviderImpl
    implements GameModuleLevelListDataProvider {
  GameModuleLevelListDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  Future<List<GameModuleLevelDto>> getLevels() async =>
      (await _api.get('/levels') as List)
          .map(
            (row) => GameModuleLevelDto.fromJson(row as Map<String, dynamic>),
          )
          .toList();

  @override
  Future<GameModuleLevelDto> getLevelById(int levelId) async =>
      GameModuleLevelDto.fromJson(
        await _api.get('/levels/$levelId') as Map<String, dynamic>,
      );

  @override
  Future<Map<int, int>> getQuestionCountsByLevel(List<int> levelIds) async {
    final counts = await Future.wait(levelIds.map(getQuestionsCountForLevel));
    return {for (var i = 0; i < levelIds.length; i++) levelIds[i]: counts[i]};
  }

  @override
  Future<int> getQuestionsCountForLevel(int levelId) async =>
      (await _api.get('/levels/$levelId/questions') as List).length;
}
