// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_module_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModuleListDto _$GameModuleListDtoFromJson(Map<String, dynamic> json) =>
    _GameModuleListDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      orderIndex: (json['order_index'] as num).toInt(),
    );

Map<String, dynamic> _$GameModuleListDtoToJson(_GameModuleListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order_index': instance.orderIndex,
    };
