import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';

abstract class TheoryModuleDataProvider {
  Future<List<TheoryModuleDto>> getModules();
  Future<TheoryModuleDto> getModuleById({required int id});
}
