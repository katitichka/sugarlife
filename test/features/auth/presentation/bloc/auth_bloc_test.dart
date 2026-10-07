import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

void main() {
  test('failed logout restores the authenticated state', () async {
    const profile = ProfileEntity(
      id: 'user-id',
      username: 'Пользователь',
      currentAvatarId: 1,
    );
    final repository = _AuthRepository(profile: profile, logoutFails: true);
    final bloc = AuthBloc(authRepository: repository);

    final signedIn = bloc.stream.firstWhere(
      (state) =>
          state.maybeWhen(authenticated: (_) => true, orElse: () => false),
    );
    bloc.add(
      const AuthEvent.signInRequested(
        email: 'user@example.com',
        password: 'password',
      ),
    );
    await signedIn;

    final states = <AuthState>[];
    final subscription = bloc.stream.listen(states.add);
    final restored = bloc.stream.firstWhere(
      (state) =>
          state.maybeWhen(authenticated: (_) => true, orElse: () => false),
    );
    bloc.add(const AuthEvent.logoutPressed());
    await restored;

    expect(
      states.any(
        (state) => state.maybeWhen(failure: (_) => true, orElse: () => false),
      ),
      isTrue,
    );
    expect(
      bloc.state.maybeWhen(authenticated: (value) => value, orElse: () => null),
      profile,
    );

    await subscription.cancel();
    await bloc.close();
  });
}

class _AuthRepository implements AuthRepository {
  _AuthRepository({required this.profile, required this.logoutFails});

  final ProfileEntity profile;
  final bool logoutFails;

  @override
  Future<ProfileEntity?> getCurrentUser() async => profile;

  @override
  Future<void> logout() async {
    if (logoutFails) throw Exception('network error');
  }

  @override
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  }) async => profile;

  @override
  Future<ProfileEntity> signUp({
    required String email,
    required String password,
    required String username,
  }) async => profile;
}
