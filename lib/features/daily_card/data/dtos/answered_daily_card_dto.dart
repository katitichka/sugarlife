import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';

part 'answered_daily_card_dto.freezed.dart';
part 'answered_daily_card_dto.g.dart';

@freezed
sealed class AnsweredDailyCardDto with _$AnsweredDailyCardDto {
  const factory AnsweredDailyCardDto({
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'daily_cards') required DailyCardDto card,
  }) = _AnsweredDailyCardDto;

  factory AnsweredDailyCardDto.fromJson(Map<String, Object?> json) =>
      _$AnsweredDailyCardDtoFromJson(json);
}
