import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/daily_card/data/dtos/answered_daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';
import 'package:sugarlife/features/daily_card/data/repositories/daily_card_repository_impl.dart';

void main() {
  group('DailyCardRepositoryImpl', () {
    test('выбирает карточку по локальному календарному дню', () async {
      final provider = _DailyCardDataProvider(
        createdAt: DateTime(2026, 9, 22, 23, 30).toUtc(),
      );
      final repository = DailyCardRepositoryImpl(
        dataProvider: provider,
        cache: AppCacheService(),
        now: () => DateTime(2026, 9, 24, 8),
      );

      final card = await repository.getTodayCard();

      expect(provider.requestedDayNumber, 3);
      expect(card?.dayNumber, 3);
    });

    test('ищет ответ в UTC-границах локального дня', () async {
      final now = DateTime(2026, 9, 24, 15, 30);
      final provider = _DailyCardDataProvider(createdAt: now);
      final repository = DailyCardRepositoryImpl(
        dataProvider: provider,
        cache: AppCacheService(),
        now: () => now,
      );

      await repository.hasAnsweredToday();

      expect(provider.rangeStart, DateTime(2026, 9, 24).toUtc());
      expect(provider.rangeEnd, DateTime(2026, 9, 25).toUtc());
    });

    test('явно сообщает об отсутствии авторизации', () {
      final repository = DailyCardRepositoryImpl(
        dataProvider: _DailyCardDataProvider(
          createdAt: DateTime(2026),
          userId: null,
        ),
        cache: AppCacheService(),
      );

      expect(repository.getAnswerHistory, throwsStateError);
    });

    test('повторно использует карточку и результат проверки за день', () async {
      final now = DateTime(2026, 9, 24, 12);
      final provider = _DailyCardDataProvider(createdAt: DateTime(2026, 9, 24));
      final repository = DailyCardRepositoryImpl(
        dataProvider: provider,
        cache: AppCacheService(),
        now: () => now,
      );

      expect(await repository.getAnsweredCardForToday(), isNull);
      final firstCard = await repository.getTodayCard();
      expect(await repository.getAnsweredCardForToday(), isNull);
      final secondCard = await repository.getTodayCard();

      expect(secondCard, firstCard);
      expect(provider.answeredCardRequestCount, 1);
      expect(provider.profileRequestCount, 1);
      expect(provider.cardRequestCount, 1);
    });

    test('сохраняет ответ в кэше после успешной отправки', () async {
      final now = DateTime(2026, 9, 24, 12);
      final provider = _DailyCardDataProvider(createdAt: DateTime(2026, 9, 24));
      final repository = DailyCardRepositoryImpl(
        dataProvider: provider,
        cache: AppCacheService(),
        now: () => now,
      );

      final card = await repository.getTodayCard();
      await repository.saveUserAnswer(card!.id, true);
      final answer = await repository.getAnsweredCardForToday();

      expect(answer?.card, card);
      expect(answer?.isCorrect, isTrue);
      expect(provider.answeredCardRequestCount, 0);
    });
  });
}

class _DailyCardDataProvider implements DailyCardDataProvider {
  _DailyCardDataProvider({required this.createdAt, this.userId = 'user-id'});

  final DateTime createdAt;

  final String? userId;

  int? requestedDayNumber;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  int profileRequestCount = 0;
  int cardRequestCount = 0;
  int answeredCardRequestCount = 0;

  @override
  String? get currentUserId => userId;

  @override
  Future<DateTime?> getUserProfileCreatedAt(String userId) async {
    profileRequestCount++;
    return createdAt;
  }

  @override
  Future<DailyCardDto?> getDailyCardByDayNumber(int dayNumber) async {
    cardRequestCount++;
    requestedDayNumber = dayNumber;
    return DailyCardDto(
      id: 1,
      question: 'Вопрос',
      isMyth: false,
      explanation: 'Объяснение',
      dayNumber: dayNumber,
    );
  }

  @override
  Future<bool> hasAnsweredInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async {
    rangeStart = start;
    rangeEnd = end;
    return false;
  }

  @override
  Future<AnsweredDailyCardDto?> getAnsweredCardInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async {
    answeredCardRequestCount++;
    return null;
  }

  @override
  Future<List<bool>> getAnswerHistory(String userId) async => const [];

  @override
  Future<void> upsertUserAnswer({
    required String userId,
    required int cardId,
    required bool isCorrect,
    required String completedAt,
  }) async {}
}
