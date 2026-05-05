part of 'daily_card_bloc.dart';

@freezed
sealed class DailyCardEvent with _$DailyCardEvent {
  const factory DailyCardEvent.loadTodayCard() = _LoadTodayCard;
  
  const factory DailyCardEvent.answerCard({
    required int cardId,
    required bool isCorrect,
    required String explanation,
  }) = _AnswerCard;
  
  const factory DailyCardEvent.close() = _Close;
}