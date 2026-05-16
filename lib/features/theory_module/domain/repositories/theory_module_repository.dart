import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

abstract interface class TheoryModuleRepository {
  Future<List<TheoryModuleEntity>> getAllModules(); // Получить все модули
}
