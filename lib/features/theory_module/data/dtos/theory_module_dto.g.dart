// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theory_module_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TheoryModuleDto _$TheoryModuleDtoFromJson(Map<String, dynamic> json) =>
    _TheoryModuleDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      colorHex: json['color_hex'] as String,
      orderIndex: (json['order_index'] as num).toInt(),
    );

Map<String, dynamic> _$TheoryModuleDtoToJson(_TheoryModuleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'color_hex': instance.colorHex,
      'order_index': instance.orderIndex,
    };
