import 'package:sugarlife/features/game_module/level/data/dtos/game_module_level_dto.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_list_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameModuleLevelListDataProviderImpl
    implements GameModuleLevelListDataProvider {
  GameModuleLevelListDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  static int _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    throw FormatException('Expected int-compatible value, got $value');
  }

  @override
  Future<List<GameModuleLevelDto>> getLevels() async {
    final response = await _supabase
        .from('levels')
        .select('id, order_index, theory_module_id')
        .order('theory_module_id')
        .order('order_index');
    return response.map((row) => GameModuleLevelDto.fromJson(row)).toList();
  }

  @override
  Future<GameModuleLevelDto> getLevelById(int levelId) async {
    final response = await _supabase
        .from('levels')
        .select('id, order_index, theory_module_id')
        .eq('id', levelId)
        .single();
    return GameModuleLevelDto.fromJson(response);
  }

  @override
  Future<Map<int, int>> getQuestionCountsByLevel(List<int> levelIds) async {
    final questionCountByLevel = <int, int>{for (final id in levelIds) id: 0};

    final response = await _supabase
        .from('questions')
        .select('level_id')
        .inFilter('level_id', levelIds);

    for (final row in response) {
      final lid = _asInt(row['level_id']);
      questionCountByLevel[lid] = (questionCountByLevel[lid] ?? 0) + 1;
    }
    return questionCountByLevel;
  }

  @override
  Future<int> getQuestionsCountForLevel(int levelId) async {
    final response = await _supabase
        .from('questions')
        .select('id')
        .eq('level_id', levelId);
    return response.length;
  }
}
