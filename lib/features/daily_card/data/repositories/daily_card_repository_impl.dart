import 'package:sugarlife/features/daily_card/data/mappers/daily_card_dto_mapper.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

class DailyCardRepositoryImpl implements DailyCardRepository {
  final DailyCardDataProvider _dataProvider;
  final DateTime Function() _now;

  DailyCardRepositoryImpl({
    required DailyCardDataProvider dataProvider,
    DateTime Function()? now,
  }) : _dataProvider = dataProvider,
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
    final createdAt = await _dataProvider.getUserProfileCreatedAt(_userId);
    if (createdAt == null) return null;

    final createdDate = _localDate(createdAt);
    final today = _localDate(_now());
    final dayNumber = today.difference(createdDate).inDays + 1;
    if (dayNumber < 1) return null;

    final dto = await _dataProvider.getDailyCardByDayNumber(dayNumber);
    return dto == null ? null : DailyCardDtoMapper.toEntity(dto: dto);
  }

  @override
  Future<void> saveUserAnswer(int cardId, bool isCorrect) async {
    await _dataProvider.upsertUserAnswer(
      userId: _userId,
      cardId: cardId,
      isCorrect: isCorrect,
      completedAt: _now().toUtc().toIso8601String(),
    );
  }

  @override
  Future<bool> hasAnsweredToday() {
    final now = _now();
    return _dataProvider.hasAnsweredInRange(
      userId: _userId,
      start: _localDate(now).toUtc(),
      end: _nextLocalDate(now).toUtc(),
    );
  }

  @override
  Future<AnsweredDailyCardEntity?> getAnsweredCardForToday() async {
    final now = _now();
    final answered = await _dataProvider.getAnsweredCardInRange(
      userId: _userId,
      start: _localDate(now).toUtc(),
      end: _nextLocalDate(now).toUtc(),
    );

    if (answered == null) return null;

    return AnsweredDailyCardEntity(
      isCorrect: answered.isCorrect,
      card: DailyCardDtoMapper.toEntity(dto: answered.card),
    );
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
