import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';

part 'answered_daily_card_entity.freezed.dart';

@freezed
sealed class AnsweredDailyCardEntity with _$AnsweredDailyCardEntity {
  const factory AnsweredDailyCardEntity({
    required bool isCorrect,
    required DailyCardEntity card,
  }) = _AnsweredDailyCardEntity;
}
