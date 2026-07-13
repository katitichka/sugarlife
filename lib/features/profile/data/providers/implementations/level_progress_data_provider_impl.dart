import 'package:sugarlife/features/profile/data/DTOs/level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/DTOs/save_level_progress_dto.dart';
import 'package:sugarlife/features/profile/data/providers/level_progress_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LevelProgressDataProviderImpl implements LevelProgressDataProvider {
  LevelProgressDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  String get currentUserId {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      throw StateError('Нет авторизованного пользователя');
    }
    return userId;
  }

  @override
  Future<LevelProgressDto?> getLevelProgress({
    required String userId,
    required int levelId,
  }) async {
    final response = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId)
        .eq('level_id', levelId)
        .maybeSingle();
    return response == null ? null : LevelProgressDto.fromJson(response);
  }

  @override
  Future<void> insertLevelProgress(SaveLevelProgressDto progress) async {
    await _supabase.from('user_progress').insert(progress.toJson());
  }

  @override
  Future<void> updateLevelProgress(SaveLevelProgressDto progress) async {
    await _supabase
        .from('user_progress')
        .update({
          'stars': progress.stars,
          'correct_answers': progress.correctAnswers,
          'completed_at': progress.completedAt,
        })
        .eq('user_id', progress.userId)
        .eq('level_id', progress.levelId);
  }

  @override
  Future<List<LevelProgressDto>> getAllLevelsProgress({
    required String userId,
  }) async {
    final response = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId);
    return response.map((row) => LevelProgressDto.fromJson(row)).toList();
  }
}
