import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/daily_card/data/mappers/daily_card_dto_mapper.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

class DailyCardRepositoryImpl implements DailyCardRepository {
  final DailyCardDataProvider _dataProvider;
  final AppCacheService _cache;
  final DateTime Function() _now;

  DailyCardRepositoryImpl({
    required DailyCardDataProvider dataProvider,
    required AppCacheService cache,
    DateTime Function()? now,
  }) : _dataProvider = dataProvider,
       _cache = cache,
       _now = now ?? DateTime.now;

  String get _userId {
    final userId = _dataProvider.currentUserId;
    if (userId == null) {
      throw StateError('Нет авторизованного пользователя');
    }
    return userId;
  }

  @override
  Future<DailyCardEntity?> getTodayCard() async {
    final userId = _userId;
    final today = _localDate(_now());
    if (_cache.hasCachedDailyCard(userId: userId, date: today)) {
      return _cache.getCachedDailyCard(userId: userId, date: today);
    }

    final createdAt = await _dataProvider.getUserProfileCreatedAt(userId);
    if (createdAt == null) {
      _cache.saveDailyCard(userId: userId, date: today, card: null);
      return null;
    }

    final createdDate = _localDate(createdAt);
    final dayNumber = today.difference(createdDate).inDays + 1;
    if (dayNumber < 1) {
      _cache.saveDailyCard(userId: userId, date: today, card: null);
      return null;
    }

    final dto = await _dataProvider.getDailyCardByDayNumber(dayNumber);
    final card = dto == null ? null : DailyCardDtoMapper.toEntity(dto: dto);
    _cache.saveDailyCard(userId: userId, date: today, card: card);
    return card;
  }

  @override
  Future<void> saveUserAnswer(int cardId, bool isCorrect) async {
    final userId = _userId;
    final now = _now();
    final today = _localDate(now);
    await _dataProvider.upsertUserAnswer(
      userId: userId,
      cardId: cardId,
      isCorrect: isCorrect,
      completedAt: now.toUtc().toIso8601String(),
    );

    final card = _cache.getCachedDailyCard(userId: userId, date: today);
    if (card != null && card.id == cardId) {
      _cache.saveDailyCardAnswer(
        userId: userId,
        date: today,
        answer: AnsweredDailyCardEntity(isCorrect: isCorrect, card: card),
      );
    }
  }

  @override
  Future<bool> hasAnsweredToday() async {
    final userId = _userId;
    final now = _now();
    final today = _localDate(now);
    if (_cache.hasCachedDailyCardAnswer(userId: userId, date: today)) {
      return _cache.getCachedDailyCardAnswer(userId: userId, date: today) !=
          null;
    }

    final hasAnswered = await _dataProvider.hasAnsweredInRange(
      userId: userId,
      start: today.toUtc(),
      end: _nextLocalDate(now).toUtc(),
    );
    if (!hasAnswered) {
      _cache.saveDailyCardAnswer(userId: userId, date: today, answer: null);
    }
    return hasAnswered;
  }

  @override
  Future<AnsweredDailyCardEntity?> getAnsweredCardForToday() async {
    final userId = _userId;
    final now = _now();
    final today = _localDate(now);
    if (_cache.hasCachedDailyCardAnswer(userId: userId, date: today)) {
      return _cache.getCachedDailyCardAnswer(userId: userId, date: today);
    }

    final answered = await _dataProvider.getAnsweredCardInRange(
      userId: userId,
      start: today.toUtc(),
      end: _nextLocalDate(now).toUtc(),
    );

    if (answered == null) {
      _cache.saveDailyCardAnswer(userId: userId, date: today, answer: null);
      return null;
    }

    final answer = AnsweredDailyCardEntity(
      isCorrect: answered.isCorrect,
      card: DailyCardDtoMapper.toEntity(dto: answered.card),
    );
    _cache.saveDailyCardAnswer(userId: userId, date: today, answer: answer);
    return answer;
  }

  @override
  Future<List<bool>> getAnswerHistory() {
    return _dataProvider.getAnswerHistory(_userId);
  }

  DateTime _localDate(DateTime value) {
    final local = value.toLocal();
    return DateTime(local.year, local.month, local.day);
  }

  DateTime _nextLocalDate(DateTime value) {
    final local = value.toLocal();
    return DateTime(local.year, local.month, local.day + 1);
  }
}
