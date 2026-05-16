// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvatarDto _$AvatarDtoFromJson(Map<String, dynamic> json) => _AvatarDto(
  id: (json['id'] as num).toInt(),
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$AvatarDtoToJson(_AvatarDto instance) =>
    <String, dynamic>{'id': instance.id, 'image_url': instance.imageUrl};
