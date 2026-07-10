// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_daily_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnsweredDailyCardDto _$AnsweredDailyCardDtoFromJson(
  Map<String, dynamic> json,
) => _AnsweredDailyCardDto(
  isCorrect: json['is_correct'] as bool,
  card: DailyCardDto.fromJson(json['daily_cards'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnsweredDailyCardDtoToJson(
  _AnsweredDailyCardDto instance,
) => <String, dynamic>{
  'is_correct': instance.isCorrect,
  'daily_cards': instance.card,
};
