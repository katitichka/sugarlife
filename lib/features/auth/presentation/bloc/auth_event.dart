part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  // Проверка авторизации при запуске
  const factory AuthEvent.authCheckStarted() = _AuthCheckStarted;

  // Вход
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;
  
  // Регистрация
  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
    required String username,
  }) = _SignUpRequested;

  // Логаут
  const factory AuthEvent.logoutPressed() = _LogoutPressed;

  // Обновление профиля
  const factory AuthEvent.profileUpdate({
    required ProfileEntity newProfile,
  }) = _ProfileUpdate;
}
