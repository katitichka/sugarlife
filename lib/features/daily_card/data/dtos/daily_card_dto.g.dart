// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyCardDto _$DailyCardDtoFromJson(Map<String, dynamic> json) =>
    _DailyCardDto(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      isMyth: json['is_myth'] as bool,
      explanation: json['explanation'] as String,
      dayNumber: (json['day_number'] as num).toInt(),
    );

Map<String, dynamic> _$DailyCardDtoToJson(_DailyCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'is_myth': instance.isMyth,
      'explanation': instance.explanation,
      'day_number': instance.dayNumber,
    };
