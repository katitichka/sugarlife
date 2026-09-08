import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

abstract class TheoryModuleDtoMapper {
  static TheoryModuleEntity toEntity({required TheoryModuleDto dto}) {
    return TheoryModuleEntity(
      id: dto.id,
      title: dto.title,
      subtitle: dto.subtitle,
      color: AppColors.fromHex(dto.colorHex),
      orderIndex: dto.orderIndex,
    );
  }
}
