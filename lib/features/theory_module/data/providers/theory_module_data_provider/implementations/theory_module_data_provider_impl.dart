import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider/theory_module_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TheoryModuleDataProviderImpl implements TheoryModuleDataProvider {
  final supabase = Supabase.instance.client;

  @override
  Future<List<TheoryModuleDto>> getModules() async {
    try {
      final responce = await supabase
          .from('theory_module')
          .select('*, characters(image_url)')
          .order('order_index', ascending: true);
      return responce
          .map<TheoryModuleDto>((rawData) => _convertToDto(rawData))
          .toList();
    } catch (e) {
      throw Exception('Failed ti fetch modules: $e');
    }
  }

  @override
  Future<TheoryModuleDto> getModuleById({required int id}) async {
    try {
      final response = await supabase
          .from('theory_module')
          .select('*, characters(image_url)')
          .eq('id', id)
          .single();

      return _convertToDto(response);
    } catch (e) {
      throw Exception('Failed to fetch module with id $id: $e');
    }
  }

  TheoryModuleDto _convertToDto(Map<String, dynamic> rawData) {
    final characters = rawData['characters'] as Map<String, dynamic>;
    final characterImageUrl = characters['image_url'] as String;
    

    final jsonForDto = Map<String, dynamic>.from(rawData);
    jsonForDto['character_image_url'] = characterImageUrl ?? ''; 
    
    // Удаление вложенного characters 
    jsonForDto.remove('characters');

    return TheoryModuleDto.fromJson(jsonForDto);
  }
}
