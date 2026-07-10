// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LevelProgressDto _$LevelProgressDtoFromJson(Map<String, dynamic> json) =>
    _LevelProgressDto(
      levelId: (json['level_id'] as num).toInt(),
      stars: (json['stars'] as num?)?.toInt(),
      correctAnswers: (json['correct_answers'] as num?)?.toInt(),
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$LevelProgressDtoToJson(_LevelProgressDto instance) =>
    <String, dynamic>{
      'level_id': instance.levelId,
      'stars': instance.stars,
      'correct_answers': instance.correctAnswers,
      'completed_at': instance.completedAt,
    };
