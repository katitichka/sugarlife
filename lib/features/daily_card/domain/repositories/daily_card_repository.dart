import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';

abstract interface class DailyCardRepository {
  /// Получить сегодняшнюю карточку
  Future<DailyCardEntity?> getTodayCard();

  /// Сохранить ответ пользователя
  Future<void> saveUserAnswer(int cardId, bool isCorrect);

  /// Проверить, отвечал ли пользователь на карточку сегодня
  Future<bool> hasAnsweredToday();

  Future<AnsweredDailyCardEntity?> getAnsweredCardForToday();

  /// Верность всех ответов пользователя в хронологическом порядке —
  /// используется для проверки достижений за серию правильных ответов.
  Future<List<bool>> getAnswerHistory();
}