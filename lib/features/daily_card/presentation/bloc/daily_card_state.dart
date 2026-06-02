part of 'daily_card_bloc.dart';

@freezed
sealed class DailyCardState with _$DailyCardState {
  const factory DailyCardState.initial() = _Initial;
  
  const factory DailyCardState.loading() = Loading;
  
  const factory DailyCardState.loaded({
    required DailyCardEntity card,
    required bool hasAnsweredToday,
  }) = Loaded;
  
  const factory DailyCardState.answered({
    required bool isCorrect,
    required String explanation,
    required bool isMyth,
  }) = Answered;
  
  const factory DailyCardState.noMoreCards() = NoMoreCards;
  
  const factory DailyCardState.error({
    required String message,
  }) = Error;
}