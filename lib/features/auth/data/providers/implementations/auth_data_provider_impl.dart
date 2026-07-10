import 'package:sugarlife/features/auth/data/providers/auth_data_provider.dart';
import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataProviderImpl implements AuthDataProvider {
  AuthDataProviderImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  String? get currentUserId => _supabase.auth.currentUser?.id;

  @override
  Future<String?> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user?.id;
  }

  @override
  Future<String?> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
    return response.user?.id;
  }

  @override
  Future<void> signOut() {
    return _supabase.auth.signOut();
  }

  @override
  Future<ProfileDto?> getUserProfile(String userId) async {
    final response = await _supabase
        .from('user_profile')
        .select()
        .eq('id', userId)
        .maybeSingle();
    return response == null ? null : ProfileDto.fromJson(response);
  }

  @override
  Future<void> insertUserProfile({
    required String userId,
    required String username,
    required int currentAvatarId,
  }) async {
    await _supabase.from('user_profile').insert({
      'id': userId,
      'username': username,
      'current_avatar_id': currentAvatarId,
    });
  }

  @override
  Future<bool> checkEmailExists(String email) async {
    final result = await _supabase.rpc(
      'check_email_exists',
      params: {'p_email': email},
    );
    return result ?? false;
  }
}
