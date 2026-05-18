import 'package:sugarlife/core/errors/load_with_retry.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LevelProgressRepositoryImpl implements LevelProgressRepository {
  final SupabaseClient _supabase;
  LevelProgressRepositoryImpl(this._supabase);
  // Возвращает прогресс конкретного уровня для текущего пользователя
  @override
  Future<LevelProgressEntity?> getLevelProgress({required int levelId}) async {
    final userId = _supabase.auth.currentUser!.id;
    final response = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId)
        .eq('level_id', levelId)
        .maybeSingle();
    if (response != null) {
      return LevelProgressEntity(
        levelId: response['level_id'] as int? ?? 0,
        isCompleted: response['stars'] != null,
        stars: response['stars'] as int?,
        lastPlayedAt: response['completed_at'] != null
            ? DateTime.parse(response['completed_at'])
            : null,
        correctAnswers: response['correct_answers'] as int? ?? 0,
      );
    }
    return null;
  }

  // Сохраняет или обновляет прогресс уровня после прохождения
  @override
  Future<void> saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) {
    return loadWithRetry(
      () => _saveLevelProgress(
        levelId: levelId,
        stars: stars,
        correctAnswers: correctAnswers,
      ),
      maxAttempts: 3,
    );
  }

  Future<void> _saveLevelProgress({
    required int levelId,
    required int stars,
    required int correctAnswers,
  }) async {
    final userId = _supabase.auth.currentUser!.id;
    final hasProgress = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId)
        .eq('level_id', levelId)
        .maybeSingle();
    if (hasProgress == null) {
      await _supabase.from('user_progress').insert({
        'user_id': userId,
        'level_id': levelId,
        'stars': stars,
        'correct_answers': correctAnswers,
        'completed_at': DateTime.now().toIso8601String(),
      });
    } else {
      final oldStars = hasProgress['stars'] != null
          ? hasProgress['stars'] as int
          : 0;
      if (stars > oldStars) {
        await _supabase
            .from('user_progress')
            .update({
              'stars': stars,
              'correct_answers': correctAnswers,
              'completed_at': DateTime.now().toIso8601String(),
            })
            .eq('user_id', userId)
            .eq('level_id', levelId);
      }
    }
  }

  // Проверяет, пройден ли уровнь (если есть запись со звёздами)
  @override
  Future<bool> isLevelCompleted(int levelId) async {
    final userId = _supabase.auth.currentUser!.id;
    final hasCompleted = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId)
        .eq('level_id', levelId)
        .maybeSingle();
    if (hasCompleted == null) {
      return false;
    }
    final stars = hasCompleted['stars'];
    return stars != null;
  }

  // Возвращает прогресс по всем уровням текущего пользователя
  @override
  Future<Map<int, LevelProgressEntity>> getAllLevelsProgress() async {
    final userId = _supabase.auth.currentUser!.id;
    final response = await _supabase
        .from('user_progress')
        .select()
        .eq('user_id', userId);
    final Map<int, LevelProgressEntity> result = {};
    for (final row in response) {
      final levelId = row['level_id'] as int;
      final stars = row['stars'] as int?;
      final correctAnswers = row['correct_answers'] as int? ?? 0;
      final completedAt = row['completed_at'] as String?;
      result[levelId] = LevelProgressEntity(
        levelId: levelId,
        isCompleted: stars != null,
        stars: stars,
        lastPlayedAt: completedAt != null ? DateTime.parse(completedAt) : null,
        correctAnswers: correctAnswers,
      );
    }
    return result;
  }
}
