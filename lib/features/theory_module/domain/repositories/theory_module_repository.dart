import 'package:sugarlife/features/theory_module/domain/entities/theory_module_list_entity.dart';

abstract interface class TheoryModuleRepository {
  Future<List<TheoryModuleListEntity>> getAllModules();
  Future<TheoryModuleListEntity> getModuleById({required int id});
}
