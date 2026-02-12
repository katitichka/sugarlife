import 'dart:ui';

import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_list_entity.dart';

abstract class TheoryModuleDtoMapper {
  static TheoryModuleListEntity toEntity({required TheoryModuleDto dto}) {
    return TheoryModuleListEntity(
      id: dto.id,
      title: dto.title,
      subtitle: dto.subtitle,
      characterImageUrl: dto.characterImageUrl,
      color: _convertColor(dto.colorHex),
    );
  }

  static  Color _convertColor(String colorHex) {
    final hexCode = colorHex.replaceFirst('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

}
