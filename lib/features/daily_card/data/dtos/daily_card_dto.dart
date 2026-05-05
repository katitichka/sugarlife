import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_card_dto.freezed.dart';
part 'daily_card_dto.g.dart';

@freezed
sealed class DailyCardDto with _$DailyCardDto {
  const factory DailyCardDto({
    required int id,
    required String question,
    @JsonKey(name: 'is_myth') required bool isMyth,
    required String explanation,
    @JsonKey(name: 'day_number') required int dayNumber,
  }) = _DailyCardDto;
  factory DailyCardDto.fromJson(Map<String, Object?> json) =>
      _$DailyCardDtoFromJson(json);
}
