import 'package:sugarlife/features/daily_card/data/dtos/answered_daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';

abstract class DailyCardDataProvider {
  Future<DateTime?> getUserProfileCreatedAt(String userId);

  Future<DailyCardDto?> getDailyCardByDayNumber(int dayNumber);

  Future<void> upsertUserAnswer({
    required String userId,
    required int cardId,
    required bool isCorrect,
    required String completedAt,
  });

  Future<bool> hasAnsweredInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  });

  Future<AnsweredDailyCardDto?> getAnsweredCardInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  });
}
