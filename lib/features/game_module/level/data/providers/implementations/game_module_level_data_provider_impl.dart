import 'package:sugarlife/features/game_module/level/data/dtos/character_dto.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/level/data/providers/game_module_level_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameModuleLevelDataProviderImpl implements GameModuleLevelDataProvider {
  GameModuleLevelDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;
  static const String _charactersBucket = 'characters';

  @override
  Future<List<GameModuleQuestionDto>> getQuestionsForLevel({
    required int levelId,
  }) async {
    final response = await _supabase
        .from('questions')
        .select(
          'id, question, question_type, answers, explanation, order_index, level_id, correct_answer, character_id',
        )
        .eq('level_id', levelId)
        .order('order_index', ascending: true);

    return response.map((row) => GameModuleQuestionDto.fromJson(row)).toList();
  }

  @override
  Future<CharacterDto?> getCharacterById(int characterId) async {
    final response = await _supabase
        .from('characters')
        .select('id, image_url')
        .eq('id', characterId)
        .maybeSingle();
    return response == null ? null : CharacterDto.fromJson(response);
  }

  @override
  Future<List<CharacterDto>> getCharactersByIds(List<int> ids) async {
    final response = await _supabase
        .from('characters')
        .select('id, image_url')
        .inFilter('id', ids);
    return response.map((row) => CharacterDto.fromJson(row)).toList();
  }

  @override
  String resolveCharacterImageUrl(String path) {
    return _supabase.storage.from(_charactersBucket).getPublicUrl(path);
  }
}
