import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/router/app_router.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

void main() {
  group('authRedirect', () {
    test('protects root and nested application routes', () {
      const state = AuthState.unauthenticated();

      expect(authRedirect(authState: state, location: '/game'), '/login');
      expect(
        authRedirect(authState: state, location: '/game/level/12'),
        '/login',
      );
      expect(
        authRedirect(authState: state, location: '/theory/module/3'),
        '/login',
      );
      expect(
        authRedirect(authState: state, location: '/choose-character'),
        '/login',
      );
    });

    test('keeps public routes public', () {
      const state = AuthState.unauthenticated();

      expect(authRedirect(authState: state, location: '/splash'), isNull);
      expect(authRedirect(authState: state, location: '/login'), isNull);
      expect(authRedirect(authState: state, location: '/register'), isNull);
    });

    test('does not show auth forms to an authenticated user', () {
      const state = AuthState.authenticated(
        profile: ProfileEntity(
          id: 'user-id',
          username: 'Пользователь',
          currentAvatarId: 1,
        ),
      );

      expect(authRedirect(authState: state, location: '/login'), '/game');
      expect(authRedirect(authState: state, location: '/register'), '/game');
      expect(authRedirect(authState: state, location: '/profile'), isNull);
    });
  });
}
