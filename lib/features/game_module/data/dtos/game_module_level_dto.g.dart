// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_module_level_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModuleLevelDto _$GameModuleLevelDtoFromJson(Map<String, dynamic> json) =>
    _GameModuleLevelDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      orderIndex: (json['order_index'] as num).toInt(),
    );

Map<String, dynamic> _$GameModuleLevelDtoToJson(_GameModuleLevelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order_index': instance.orderIndex,
    };
