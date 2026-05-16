// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_module_level_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModuleLevelDto _$GameModuleLevelDtoFromJson(Map<String, dynamic> json) =>
    _GameModuleLevelDto(
      id: (json['id'] as num).toInt(),
      orderIndex: (json['order_index'] as num).toInt(),
      theoryModuleId: (json['theory_module_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameModuleLevelDtoToJson(_GameModuleLevelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_index': instance.orderIndex,
      'theory_module_id': instance.theoryModuleId,
    };
