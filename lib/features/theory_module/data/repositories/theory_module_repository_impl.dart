import 'package:sugarlife/features/theory_module/data/mappers/theory_module_dto_mapper.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider/implementations/theory_module_data_provider_impl.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_list_entity.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

class TheoryModuleRepositoryImpl implements TheoryModuleRepository {
  final TheoryModuleDataProviderImpl _dataProvider;

  TheoryModuleRepositoryImpl({
    required TheoryModuleDataProviderImpl dataProvider,
  }) : _dataProvider = dataProvider;

  @override
  Future<List<TheoryModuleListEntity>> getAllModules() async {
    final dtos = await _dataProvider.getModules();
    return dtos.map((dto) => TheoryModuleDtoMapper.toEntity(dto: dto)).toList();
  }

  @override
  Future<TheoryModuleListEntity> getModuleById({required int id}) async {
    final dto = await _dataProvider.getModuleById(id: id);
    return TheoryModuleDtoMapper.toEntity(dto: dto);
  }
}
