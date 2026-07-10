import 'package:sugarlife/features/achievement/data/dtos/achievement_dto.dart';
import 'package:sugarlife/features/achievement/data/providers/achievement_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AchievementDataProviderImpl implements AchievementDataProvider {
  AchievementDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  static const String _achievementsBucket = 'achievements';
  static const String _achievementColumns = 'id, name, description, image_url';

  @override
  String? get currentUserId => _supabase.auth.currentUser?.id;

  @override
  String resolveImageUrl(String path) {
    return _supabase.storage.from(_achievementsBucket).getPublicUrl(path);
  }

  @override
  Future<AchievementDto?> getAchievementById(int id) async {
    final response = await _supabase
        .from('achievements')
        .select(_achievementColumns)
        .eq('id', id)
        .maybeSingle();
    return response == null ? null : AchievementDto.fromJson(response);
  }

  @override
  Future<List<AchievementDto>> getAllAchievements() async {
    final response = await _supabase.from('achievements').select(_achievementColumns);
    return response.map((row) => AchievementDto.fromJson(row)).toList();
  }

  @override
  Future<List<int>> getUserAchievementIds(String userId) async {
    final response = await _supabase
        .from('user_achievement')
        .select('achievement_id')
        .eq('user_id', userId);
    return response.map((row) => (row['achievement_id'] as num).toInt()).toList();
  }

  @override
  Future<List<AchievementDto>> getAchievementsByIds(List<int> ids) async {
    final response = await _supabase
        .from('achievements')
        .select(_achievementColumns)
        .inFilter('id', ids)
        .order('id');
    return response.map((row) => AchievementDto.fromJson(row)).toList();
  }

  @override
  Future<void> insertUserAchievement({
    required String userId,
    required int achievementId,
  }) async {
    await _supabase.from('user_achievement').insert({
      'user_id': userId,
      'achievement_id': achievementId,
    });
  }

  @override
  Future<bool> hasUserAchievement({
    required String userId,
    required int achievementId,
  }) async {
    final response = await _supabase
        .from('user_achievement')
        .select('achievement_id')
        .eq('user_id', userId)
        .eq('achievement_id', achievementId)
        .maybeSingle();
    return response != null;
  }
}
