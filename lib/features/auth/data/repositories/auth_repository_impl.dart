import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;

  AuthRepositoryImpl(this._supabase);

  @override
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Аутентификация пользователя в Supabase
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Проверка наличия данных пользователя в ответе
      final authUser = response.user;
      if (authUser == null) {
        throw Exception('Не удалось войти');
      }

      // Получение данных профиля из таблицы user_profile
      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      // Проверка существования профиля
      if (profileData == null) {
        throw Exception('Профиль пользователя не найден');
      }

      // Формирование и возврат сущности профиля
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
      // Получение текущего авторизованного пользователя
      final authUser = _supabase.auth.currentUser;
      if (authUser == null) return null;

      // Получение данных профиля
      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      if (profileData == null) return null;

      // Формирование сущности профиля
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
      // Выход из текущей сессии
      await _supabase.auth.signOut();
    } catch (e) {
      print('Ошибка выхода: $e');
      rethrow;
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
      // Регистрация нового пользователя в Supabase Auth
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      // Проверка успешности создания пользователя
      final authUser = response.user;
      if (authUser == null) {
        throw Exception('Не удалось создать пользователя');
      }

      // Попытка получения профиля (должен создаться триггером)
      final profileData = await _supabase
          .from('user_profile')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      // Создание профиля вручную, если триггер не сработал
      if (profileData == null) {
        await _supabase.from('user_profile').insert({
          'id': authUser.id,
          'username': username,
          'current_avatar_id': 1,
        });

        // Получение созданного профиля
        final newProfileData = await _supabase
            .from('user_profile')
            .select()
            .eq('id', authUser.id)
            .single();

        return _mapToProfileEntity(authUser, newProfileData);
      }

      // Возврат существующего профиля
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
      return result ?? false; // если результат null, возвращаем false
    } catch (e) {
      print('Ошибка проверки email: $e');
      return false; // при ошибке считаем, что email свободен
    }
  }
}

// Преобразование данных из Supabase в сущность ProfileEntity
ProfileEntity _mapToProfileEntity(
  User authUser,
  Map<String, dynamic> profileData,
) {

  // Формирование сущности профиля
  return ProfileEntity(
    id: authUser.id,
    username: profileData['username'] ?? '',
    currentAvatarId: profileData['current_avatar_id'] ?? 1,
  );
}
