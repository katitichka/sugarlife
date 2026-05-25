import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/data/mappers/daily_card_dto_mapper.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DailyCardRepositoryImpl implements DailyCardRepository {
  final SupabaseClient _supabase;
  final String _userId;

  DailyCardRepositoryImpl(this._supabase, this._userId);

Future<DailyCardEntity?> getTodayCard({int retries = 3}) async {
  for (int attempt = 0; attempt < retries; attempt++) {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        print('Пользователь не авторизован');
        return null;
      }

      final userResponse = await _supabase
          .from('user_profile')
          .select('created_at')
          .eq('id', _userId)
          .maybeSingle();

      if (userResponse == null) {
        print('[DailyCardRepository] User profile not found: $_userId');
        return null;
      }

      final createdAt = DateTime.parse(userResponse['created_at']);
      final today = DateTime.now();
      final dayNumber = today.difference(createdAt).inDays + 1;
      
      print('[DailyCardRepository] Day number: $dayNumber, attempt: ${attempt + 1}');

      final response = await _supabase
          .from('daily_cards')
          .select()
          .eq('day_number', dayNumber)
          .maybeSingle();

      if (response != null) {
        final dto = DailyCardDto.fromJson(response);
        return DailyCardDtoMapper.toEntity(dto: dto);
      }
      
      print('[DailyCardRepository] No card for day: $dayNumber');
      return null;
      
    } catch (e) {
      print('[DailyCardRepository] Attempt ${attempt + 1} failed: $e');
      if (attempt == retries - 1) rethrow;
      await Future.delayed(Duration(milliseconds: 500 * (attempt + 1)));
    }
  }
  return null;
}

@override
Future<void> saveUserAnswer(int cardId, bool isCorrect) async {
  try {
    await _supabase.from('user_daily_cards').upsert({
      'user_id': _userId,
      'card_id': cardId,
      'is_correct': isCorrect,
      'completed_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id,card_id');
    
    print('[DailyCardRepository] Answer saved: cardId=$cardId, isCorrect=$isCorrect');
  } catch (e, stackTrace) {
    print('[DailyCardRepository] Save answer error: $e');
    print('[DailyCardRepository] Stack: $stackTrace');
    rethrow;
  }
}

@override
Future<bool> hasAnsweredToday() async {
  try {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final response = await _supabase
      .from('user_daily_cards')
      .select('card_id')
      .eq('user_id', _userId)
      .gte('completed_at', startOfDay.toIso8601String())
      .lt('completed_at', endOfDay.toIso8601String());

    return response.isNotEmpty;
  } catch (e) {
    print('[DailyCardRepository] Check answered error: $e');
    return false;
  }
}
@override
Future<Map<String, dynamic>?> getAnsweredCardForToday() async {
  try {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final response = await _supabase
      .from('user_daily_cards')
      .select('''
        is_correct,
        daily_cards(*)
      ''')
      .eq('user_id', _userId)
      .gte('completed_at', startOfDay.toIso8601String())
      .lt('completed_at', endOfDay.toIso8601String())
      .maybeSingle();

    if (response == null) return null;
    
    final cardDto = DailyCardDto.fromJson(response['daily_cards']);
    final cardEntity = DailyCardDtoMapper.toEntity(dto: cardDto);
    
    return {
      'is_correct': response['is_correct'],
      'card': cardEntity,
    };
  } catch (e) {
    print('[DailyCardRepository] Get answered card error: $e');
    return null;
  }
}
}
