import 'dart:ui';

import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';


abstract class TheoryModuleDtoMapper {
  static TheoryModuleEntity toEntity({required TheoryModuleDto dto}) {
    return TheoryModuleEntity(
      id: dto.id,
      title: dto.title,
      subtitle: dto.subtitle,
      characterImageUrl: dto.characterImageUrl,
      color: _convertColor(dto.colorHex),
      orderIndex: dto.orderIndex,
      characterId: dto.characterId,
      content: dto.content,
    );
  }

  static  Color _convertColor(String colorHex) {
    final hexCode = colorHex.replaceFirst('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

}
