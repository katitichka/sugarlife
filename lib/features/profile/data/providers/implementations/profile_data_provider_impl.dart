import 'package:sugarlife/features/avatars/data/dtos/avatar_dto.dart';
import 'package:sugarlife/features/profile/data/providers/profile_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataProviderImpl implements ProfileDataProvider {
  ProfileDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  static const String _avatarsSvgBucket = 'avatars';

  @override
  String? get currentUserId => _supabase.auth.currentUser?.id;

  @override
  String resolveAvatarUrl(String path) {
    return _supabase.storage.from(_avatarsSvgBucket).getPublicUrl(path);
  }

  @override
  Future<AvatarDto> getAvatarById(int avatarId) async {
    final response = await _supabase
        .from('avatars')
        .select('id, image_url')
        .eq('id', avatarId)
        .single();
    return AvatarDto.fromJson(response);
  }

  @override
  Future<void> updateUsername({
    required String userId,
    required String newUsername,
  }) async {
    await _supabase
        .from('user_profile')
        .update({'username': newUsername})
        .eq('id', userId);
  }

  @override
  Future<void> updateAvatar({
    required String userId,
    required int avatarId,
  }) async {
    await _supabase
        .from('user_profile')
        .update({'current_avatar_id': avatarId})
        .eq('id', userId);
  }

  @override
  Future<List<AvatarDto>> getAllAvatars() async {
    final response = await _supabase
        .from('avatars')
        .select('id, image_url')
        .order('id');
    return response.map((row) => AvatarDto.fromJson(row)).toList();
  }
}
