import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_card_entity.freezed.dart';

@freezed
sealed class DailyCardEntity with _$DailyCardEntity {
  const factory DailyCardEntity({
    required int id,
    required String question,
    required bool isMyth,
    required String explanation,
    required int dayNumber,
  }) = _DailyCardEntity;
}
