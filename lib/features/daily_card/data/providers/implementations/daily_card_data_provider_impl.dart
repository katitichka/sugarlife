import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/daily_card/data/dtos/answered_daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';

class DailyCardDataProviderImpl implements DailyCardDataProvider {
  DailyCardDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  String? get currentUserId => _api.currentUserId;

  @override
  Future<DateTime?> getUserProfileCreatedAt(String userId) async {
    final profile = await _api.get('/me') as Map<String, dynamic>;
    final createdAt = profile['created_at'] as String?;
    return createdAt == null ? null : DateTime.parse(createdAt);
  }

  @override
  Future<DailyCardDto?> getDailyCardByDayNumber(int dayNumber) async {
    try {
      return DailyCardDto.fromJson(
        await _api.get('/daily-cards/$dayNumber') as Map<String, dynamic>,
      );
    } on ApiException catch (error) {
      if (error.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<void> upsertUserAnswer({
    required String userId,
    required int cardId,
    required bool isCorrect,
    required String completedAt,
  }) async {
    await _api.put('/me/daily-cards/$cardId', {'is_correct': isCorrect});
  }

  Future<List<Map<String, dynamic>>> _answersInRange(
    DateTime start,
    DateTime end,
  ) async =>
      (await _api.get(
                '/me/daily-cards/history',
                query: {
                  'from': start.toUtc().toIso8601String(),
                  'to': end.toUtc().toIso8601String(),
                },
              )
              as List)
          .cast<Map<String, dynamic>>();

  @override
  Future<bool> hasAnsweredInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async => (await _answersInRange(start, end)).isNotEmpty;

  @override
  Future<AnsweredDailyCardDto?> getAnsweredCardInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async {
    final rows = await _answersInRange(start, end);
    if (rows.isEmpty) return null;
    final row = rows.first;
    return AnsweredDailyCardDto.fromJson({
      'is_correct': row['is_correct'],
      'daily_cards': {
        for (final key in [
          'id',
          'question',
          'is_myth',
          'explanation',
          'day_number',
        ])
          key: row[key],
      },
    });
  }

  @override
  Future<List<bool>> getAnswerHistory(String userId) async =>
      (await _api.get('/me/daily-cards') as List)
          .map((row) => (row as Map<String, dynamic>)['is_correct'] as bool)
          .toList();
}
