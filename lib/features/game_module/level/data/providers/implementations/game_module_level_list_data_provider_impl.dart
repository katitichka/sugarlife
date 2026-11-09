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
    if (levelIds.isEmpty) return {};
    final rows = await _api.get('/levels/question-counts') as List;
    final counts = {
      for (final row in rows)
        (row as Map<String, dynamic>)['level_id'] as int:
            row['question_count'] as int,
    };
    return {for (final id in levelIds) id: counts[id] ?? 0};
  }

  @override
  Future<int> getQuestionsCountForLevel(int levelId) async =>
      (await getQuestionCountsByLevel([levelId]))[levelId] ?? 0;
}
