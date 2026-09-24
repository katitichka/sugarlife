import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/core/services/app_logger.dart';
import 'package:sugarlife/features/auth/data/providers/auth_data_provider.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const _tag = 'AuthRepositoryImpl';

  final AuthDataProvider _dataProvider;
  final AppCacheService _cache;

  AuthRepositoryImpl({
    required AuthDataProvider dataProvider,
    required AppCacheService cache,
  }) : _dataProvider = dataProvider,
       _cache = cache;

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
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка входа', error, stackTrace, _tag);
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
    } catch (error, stackTrace) {
      AppLogger.error(
        'Не удалось получить текущего пользователя',
        error,
        stackTrace,
        _tag,
      );
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dataProvider.signOut();
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка выхода', error, stackTrace, _tag);
      rethrow;
    }
    try {
      await _cache.clearAll();
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка очистки кэша', error, stackTrace, _tag);
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
    } catch (error, stackTrace) {
      AppLogger.error('Ошибка регистрации', error, stackTrace, _tag);
      rethrow;
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
