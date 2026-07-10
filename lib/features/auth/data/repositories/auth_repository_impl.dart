import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/auth/data/providers/auth_data_provider.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataProvider _dataProvider;
  final AppCacheService _cache;

  AuthRepositoryImpl(this._dataProvider, this._cache);

  @override
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await _dataProvider.signInWithPassword(
        email: email,
        password: password,
      );

      if (userId == null) {
        throw Exception('Не удалось войти');
      }

      final profileData = await _dataProvider.getUserProfile(userId);

      if (profileData == null) {
        throw Exception('Профиль пользователя не найден');
      }

      return _mapToProfileEntity(userId, profileData);
    } catch (e) {
      print('Ошибка входа: $e');
      rethrow;
    }
  }

  @override
  Future<ProfileEntity?> getCurrentUser() async {
    try {
      final userId = _dataProvider.currentUserId;
      if (userId == null) return null;

      final profileData = await _dataProvider.getUserProfile(userId);

      if (profileData == null) return null;

      return _mapToProfileEntity(userId, profileData);
    } catch (e) {
      print('Пользователь не найден: $e');
      return null;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dataProvider.signOut();
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
      final userId = await _dataProvider.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      if (userId == null) {
        throw Exception('Не удалось создать пользователя');
      }

      final profileData = await _dataProvider.getUserProfile(userId);

      if (profileData == null) {
        await _dataProvider.insertUserProfile(
          userId: userId,
          username: username,
          currentAvatarId: 1,
        );

        final newProfileData = await _dataProvider.getUserProfile(userId);
        if (newProfileData == null) {
          throw Exception('Не удалось создать профиль пользователя');
        }

        return _mapToProfileEntity(userId, newProfileData);
      }

      return _mapToProfileEntity(userId, profileData);
    } catch (e) {
      print('Ошибка регистрации: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isEmailExists({required String email}) async {
    try {
      return await _dataProvider.checkEmailExists(email);
    } catch (e) {
      print('Ошибка проверки email: $e');
      return false;
    }
  }
}

ProfileEntity _mapToProfileEntity(String userId, ProfileDto profileData) {
  return ProfileEntity(
    id: userId,
    username: profileData.username,
    currentAvatarId: profileData.currentAvatarId,
  );
}
