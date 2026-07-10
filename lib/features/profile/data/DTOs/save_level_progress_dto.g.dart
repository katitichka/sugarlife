// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_level_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveLevelProgressDto _$SaveLevelProgressDtoFromJson(
  Map<String, dynamic> json,
) => _SaveLevelProgressDto(
  userId: json['user_id'] as String,
  levelId: (json['level_id'] as num).toInt(),
  stars: (json['stars'] as num).toInt(),
  correctAnswers: (json['correct_answers'] as num).toInt(),
  completedAt: json['completed_at'] as String,
);

Map<String, dynamic> _$SaveLevelProgressDtoToJson(
  _SaveLevelProgressDto instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'level_id': instance.levelId,
  'stars': instance.stars,
  'correct_answers': instance.correctAnswers,
  'completed_at': instance.completedAt,
};
