// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_docs_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDocsResponseDto _$ProfileDocsResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ProfileDocsResponseDto(
  id: json['id'] as String,
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
  gender: json['gender'] as String,
);

Map<String, dynamic> _$ProfileDocsResponseDtoToJson(
  _ProfileDocsResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'age': instance.age,
  'gender': instance.gender,
};
