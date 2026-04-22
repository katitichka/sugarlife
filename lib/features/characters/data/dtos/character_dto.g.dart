// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) =>
    _CharacterDto(
      id: (json['id'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CharacterDtoToJson(_CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'name': instance.name,
    };
