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
      characterId: (json['character_id'] as num).toInt(),
      colorHex: json['color_hex'] as String,
      orderIndex: (json['order_index'] as num).toInt(),
      characterImageUrl: json['character_image_url'] as String,
    );

Map<String, dynamic> _$TheoryModuleDtoToJson(_TheoryModuleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'character_id': instance.characterId,
      'color_hex': instance.colorHex,
      'order_index': instance.orderIndex,
      'character_image_url': instance.characterImageUrl,
    };
