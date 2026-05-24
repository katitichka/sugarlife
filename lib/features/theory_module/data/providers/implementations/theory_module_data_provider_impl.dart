import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TheoryModuleDataProviderImpl implements TheoryModuleDataProvider {
  final SupabaseClient _supabase;
  TheoryModuleDataProviderImpl(this._supabase);

  @override
  Future<List<TheoryModuleDto>> getModules() async {
    try {
      final response = await _supabase
          .from('theory_module')
          .select('id, title, subtitle, color_hex, order_index')
          .order('order_index', ascending: true);
      
      return response
          .map<TheoryModuleDto>((rawData) => _convertToDto(rawData))
          .toList();
    } catch (e) {
      print('❌ Ошибка в getModules(): $e');
      rethrow;
    }
  }

  TheoryModuleDto _convertToDto(Map<String, dynamic> rawData) {
    return TheoryModuleDto.fromJson(rawData);
  }
}