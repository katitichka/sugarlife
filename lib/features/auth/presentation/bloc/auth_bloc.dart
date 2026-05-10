import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const _Initial()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        _AuthCheckStarted() => _authCheckStarted(emit: emit),
        _SignInRequested(:final email, :final password) => _signInRequested(
          emit: emit,
          email: email,
          password: password,
        ),
        _SignUpRequested(:final email, :final password, :final username) =>
          _signUpRequested(
            emit: emit,
            email: email,
            password: password,
            username: username,
          ),
        _LogoutPressed() => _logoutPressed(emit: emit),
        _ProfileUpdate(:final newProfile) => _profileUpdate(
          emit: emit,
          newProfile: newProfile,
        ),
      },
    );
  }
  Future<void> _authCheckStarted({required Emitter<AuthState> emit}) async {
    try {
      emit(const AuthState.loading());
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null) {
        emit(AuthState.unauthenticated());
      } else {
        emit(AuthState.authenticated(profile: currentUser));
      }
    } catch (e) {
      emit(AuthState.failure(message: 'Ошибка проверки авторизации: $e'));
    }
  }

  Future<void> _signInRequested({
    required Emitter<AuthState> emit,
    required String email,
    required String password,
  }) async {
    try {
      emit(const AuthState.loading());
      final profile = await _authRepository.signIn(
        email: email,
        password: password,
      );
      emit(AuthState.authenticated(profile: profile));
    } catch (e) {
      emit(AuthState.failure(message: 'Ошибка авторизации: $e'));
    }
  }

  Future<void> _signUpRequested({
    required Emitter<AuthState> emit,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      emit(const AuthState.loading());
      if (password.length < 6) {
        emit(
          const AuthState.failure(
            message: 'Пароль должен быть не менее 6 символов',
          ),
        );
        return;
      }
      final isUniqueEmail = await _authRepository.isEmailExists(email: email);
      if (isUniqueEmail) {
        emit(
          const AuthState.failure(
            message: 'Аккаунт с таким email уже существует',
          ),
        );
        return;
      }
      final profile = await _authRepository.signUp(
        email: email,
        password: password,
        username: username,
      );
      emit(AuthState.authenticated(profile: profile));
    } catch (e) {
      emit(AuthState.failure(message: 'Ошибка регистрации: $e'));
    }
  }

  Future<void> _logoutPressed({required Emitter<AuthState> emit}) async {
    try {
      emit(const AuthState.loading());
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.failure(message: 'Ошибка выхода: $e'));
    }
  }

  Future<void> _profileUpdate({
    required Emitter<AuthState> emit,
    required ProfileEntity newProfile,
  }) async {
    state.maybeWhen(
      authenticated: (_) => emit(AuthState.authenticated(profile: newProfile)),
      orElse: () => {},
    );
  }
}
