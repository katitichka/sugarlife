import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

abstract interface class TheoryModuleRepository {
  Future<List<TheoryModuleEntity>> getAllModules(); // Получить все модули (без content)
  Future<TheoryModuleEntity> getModuleById({required int id}); // Получить модуль по id (с content)
}
