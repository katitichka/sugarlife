import 'package:sugarlife/features/daily_card/data/mappers/daily_card_dto_mapper.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';

class DailyCardRepositoryImpl implements DailyCardRepository {
  final DailyCardDataProvider _dataProvider;
  final String _userId;

  DailyCardRepositoryImpl(this._dataProvider, this._userId);

Future<DailyCardEntity?> getTodayCard({int retries = 3}) async {
  for (int attempt = 0; attempt < retries; attempt++) {
    try {
      final userId = _dataProvider.currentUserId;
      if (userId == null) {
        return null;
      }

      final createdAt = await _dataProvider.getUserProfileCreatedAt(_userId);

      if (createdAt == null) {
        print('Пользователь не найден: $_userId');
        return null;
      }

      final today = DateTime.now();
      final dayNumber = today.difference(createdAt).inDays + 1;


      final dto = await _dataProvider.getDailyCardByDayNumber(dayNumber);

      if (dto != null) {
        return DailyCardDtoMapper.toEntity(dto: dto);
      }

      return null;

    } catch (e) {
      if (attempt == retries - 1) rethrow;
      await Future.delayed(Duration(milliseconds: 300 * (attempt + 1)));
    }
  }
  return null;
}

@override
Future<void> saveUserAnswer(int cardId, bool isCorrect) async {
  try {
    await _dataProvider.upsertUserAnswer(
      userId: _userId,
      cardId: cardId,
      isCorrect: isCorrect,
      completedAt: DateTime.now().toIso8601String(),
    );

  } catch (e, stackTrace) {
    print('Ошибка сохранения ответа: $e');
    rethrow;
  }
}

@override
Future<bool> hasAnsweredToday() async {
  try {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await _dataProvider.hasAnsweredInRange(
      userId: _userId,
      start: startOfDay,
      end: endOfDay,
    );
  } catch (e) {
    print('Ошибка проверки: $e');
    return false;
  }
}
@override
Future<Map<String, dynamic>?> getAnsweredCardForToday() async {
  try {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final answered = await _dataProvider.getAnsweredCardInRange(
      userId: _userId,
      start: startOfDay,
      end: endOfDay,
    );

    if (answered == null) return null;

    final cardEntity = DailyCardDtoMapper.toEntity(dto: answered.card);

    return {
      'is_correct': answered.isCorrect,
      'card': cardEntity,
    };
  } catch (e) {
    print('Ошибка сохранения: $e');
    return null;
  }
}
}
