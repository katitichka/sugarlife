import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/router/root_navigator.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/auth/presentation/view/login_screen.dart';
import 'package:sugarlife/features/auth/presentation/view/splash_screen.dart';
import 'package:sugarlife/features/auth/presentation/view/register_screen.dart';
import 'package:sugarlife/features/avatars/presentation/view/choose_avatar_page.dart';
import 'package:sugarlife/features/game_module/level/presentation/game_module_level_provider.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_level_page.dart';
import 'package:sugarlife/features/game_module/list/presentation/view/ui/game_page.dart';
import 'package:sugarlife/features/profile/presentation/profile_page.dart';
import 'package:sugarlife/features/theory_module/presentation/theory_module_provider.dart';
import 'package:sugarlife/features/theory_module/presentation/ui/theory_page.dart';
import 'package:sugarlife/features/theory_module/presentation/ui/theory_screen_page.dart';
import 'package:sugarlife/shared/ui/app_scaffold.dart';

final appRoute = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/choose-character',
      name: 'chooseCharacter',
      builder: (context, state) {
        final currentAvatarId = state.extra as int;
        return ChooseAvatarPage(currentAvatarId: currentAvatarId);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        final fullPath = state.fullPath ?? '';
        final showBottomNav =
            fullPath == '/game' ||
            fullPath == '/theory' ||
            fullPath == '/profile';
        return AppScaffold(
          navigationShell: navigationShell,
          showBottomNav: showBottomNav,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/theory',
              name: 'theory',
              builder: (context, state) =>
                  const TheoryModuleProvider(child: TheoryPage()),
              routes: [
                GoRoute(
                  path: 'module/:moduleId',
                  name: 'theoryModule',
                  builder: (context, state) {
                    final moduleId = int.parse(
                      state.pathParameters['moduleId']!,
                    );
                    return TheoryScreenPage(moduleId: moduleId);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/game',
              name: 'game',
              builder: (context, state) => const GamePage(),
              routes: [
                GoRoute(
                  path: 'level/:levelId',
                  name: 'gameLevel',
                  builder: (context, state) {
                    final levelId = int.parse(state.pathParameters['levelId']!);
                    final extra = state.extra as Map<String, int>?;
                    final orderIndex = extra?['orderIndex'] ?? 0;
                    final theoryModuleId = extra?['theoryModuleId'] ?? 0;
                    return GameModuleLevelProvider(
                      child: GameLevelPage(
                        levelId: levelId,
                        orderIndex: orderIndex,
                        theoryModuleId: theoryModuleId,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) {
                return ProfilePage();
              },
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final isLoggedIn = authState.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );
        final location = state.matchedLocation;
        if (isLoggedIn && (location == '/login' || location == '/register')) {
          return '/game';
        }
        if (!isLoggedIn &&
            (location == '/game' ||
                location == '/theory' ||
                location == '/profile')) {
          return '/login';
        }
        return null;
      },
    ),
  ],
);
