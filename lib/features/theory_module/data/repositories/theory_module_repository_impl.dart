
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/theory_module/data/mappers/theory_module_dto_mapper.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

class TheoryModuleRepositoryImpl implements TheoryModuleRepository {
  final TheoryModuleDataProvider _dataProvider;
  final AppCacheService _cache;

  TheoryModuleRepositoryImpl({
    required TheoryModuleDataProvider dataProvider,
    required AppCacheService cache,
  }) : _dataProvider = dataProvider,
       _cache = cache;

  @override
  Future<List<TheoryModuleEntity>> getAllModules() async {
    final cachedModules = _cache.theoryModules;
    if (cachedModules != null) {
      return cachedModules;
    }

    final dtos = await _dataProvider.getModules();
    final modules = dtos
        .map((dto) => TheoryModuleDtoMapper.toEntity(dto: dto))
        .toList();
    _cache.saveTheoryModules(modules);
    return modules;
  }

  @override
  Future<TheoryModuleEntity> getModuleById({required int id}) async {
    final cachedModule = _cache.getTheoryModuleById(id);
    if (cachedModule != null && cachedModule.content != null) {
      return cachedModule;
    }

    final dto = await _dataProvider.getModuleById(id: id);
    final module = TheoryModuleDtoMapper.toEntity(dto: dto);
    _cache.saveTheoryModule(module);
    return module;
  }
}
