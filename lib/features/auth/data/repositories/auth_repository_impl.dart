import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;
  final AppCacheService _cache;

  AuthRepositoryImpl(this._supabase, this._cache);

  @override
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final authUser = response.user;
      if (authUser == null) {
        throw Exception('Не удалось войти');
      }

      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      if (profileData == null) {
        throw Exception('Профиль пользователя не найден');
      }

      return ProfileEntity(
        id: authUser.id,
        username: profileData['username'] ?? '',
        currentAvatarId: profileData['current_avatar_id'] ?? 1,
      );
    } catch (e) {
      print('Ошибка входа: $e');
      rethrow;
    }
  }

  @override
  Future<ProfileEntity?> getCurrentUser() async {
    try {
      final authUser = _supabase.auth.currentUser;
      if (authUser == null) return null;

      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      if (profileData == null) return null;

      return ProfileEntity(
        id: authUser.id,
        username: profileData['username'] ?? '',
        currentAvatarId: profileData['current_avatar_id'] ?? 1,
      );
    } catch (e) {
      print('Пользователь не найден: $e');
      return null;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      print('Ошибка выхода: $e');
      rethrow;
    }
   try {
    await _cache.clearAll();
  } catch (e) {
    print('Ошибка очистки кэша: $e');
  }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      print('Ошибка очистки локального кеша: $e');
    }
  }

  @override
  Future<ProfileEntity> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      final authUser = response.user;
      if (authUser == null) {
        throw Exception('Не удалось создать пользователя');
      }

      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      if (profileData == null) {
        await _supabase.from('user_profile').insert({
          'id': authUser.id,
          'username': username,
          'current_avatar_id': 1,
        });

        final newProfileData = await _supabase
            .from('user_profile')
            .select()
            .eq('id', authUser.id)
            .single();

        return _mapToProfileEntity(authUser, newProfileData);
      }

      return _mapToProfileEntity(authUser, profileData);
    } catch (e) {
      print('Ошибка регистрации: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isEmailExists({required String email}) async {
    try {
      final result = await _supabase.rpc(
        'check_email_exists',
        params: {'p_email': email},
      );
      return result ?? false;
    } catch (e) {
      print('Ошибка проверки email: $e');
      return false; 
    }
  }
}

ProfileEntity _mapToProfileEntity(
  User authUser,
  Map<String, dynamic> profileData,
) {

  return ProfileEntity(
    id: authUser.id,
    username: profileData['username'] ?? '',
    currentAvatarId: profileData['current_avatar_id'] ?? 1,
  );
}
