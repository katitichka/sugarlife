import 'package:sugarlife/features/daily_card/data/dtos/answered_daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/providers/daily_card_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DailyCardDataProviderImpl implements DailyCardDataProvider {
  DailyCardDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<DateTime?> getUserProfileCreatedAt(String userId) async {
    final response = await _supabase
        .from('user_profile')
        .select('created_at')
        .eq('id', userId)
        .maybeSingle();
    if (response == null) return null;
    return DateTime.parse(response['created_at']);
  }

  @override
  Future<DailyCardDto?> getDailyCardByDayNumber(int dayNumber) async {
    final response = await _supabase
        .from('daily_cards')
        .select()
        .eq('day_number', dayNumber)
        .maybeSingle();
    return response == null ? null : DailyCardDto.fromJson(response);
  }

  @override
  Future<void> upsertUserAnswer({
    required String userId,
    required int cardId,
    required bool isCorrect,
    required String completedAt,
  }) async {
    await _supabase.from('user_daily_cards').upsert({
      'user_id': userId,
      'card_id': cardId,
      'is_correct': isCorrect,
      'completed_at': completedAt,
    }, onConflict: 'user_id,card_id');
  }

  @override
  Future<bool> hasAnsweredInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async {
    final response = await _supabase
        .from('user_daily_cards')
        .select('card_id')
        .eq('user_id', userId)
        .gte('completed_at', start.toIso8601String())
        .lt('completed_at', end.toIso8601String());
    return response.isNotEmpty;
  }

  @override
  Future<AnsweredDailyCardDto?> getAnsweredCardInRange({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) async {
    final response = await _supabase
        .from('user_daily_cards')
        .select('''
        is_correct,
        daily_cards(*)
      ''')
        .eq('user_id', userId)
        .gte('completed_at', start.toIso8601String())
        .lt('completed_at', end.toIso8601String())
        .maybeSingle();

    if (response == null) return null;
    return AnsweredDailyCardDto.fromJson(response);
  }

  @override
  Future<List<bool>> getAnswerHistory(String userId) async {
    final response = await _supabase
        .from('user_daily_cards')
        .select('is_correct')
        .eq('user_id', userId)
        .order('completed_at', ascending: true);
    return response.map((row) => row['is_correct'] as bool).toList();
  }
}
