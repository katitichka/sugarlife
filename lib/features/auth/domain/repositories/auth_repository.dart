import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

abstract interface class AuthRepository {
  // Авторизация
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  });
  // Регистрация
  Future<ProfileEntity> signUp({
    required String email,
    required String password,
    required String username,
  });
  // Выход
  Future<void> logout();
  // Проверка сессии
  Future<ProfileEntity?> getCurrentUser();
}
