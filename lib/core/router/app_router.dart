import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/auth/presentation/view/login_screen.dart';
import 'package:sugarlife/features/auth/presentation/view/register_screen.dart';
import 'package:sugarlife/features/game_module_level/presentation/game_module_level_provider.dart';
import 'package:sugarlife/features/game_module_list/presentation/game_module_list_provider.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_page.dart';
import 'package:sugarlife/features/game_module_list/presentation/view/ui/game_page.dart';
import 'package:sugarlife/features/profile/presentation/profile_page.dart';
import 'package:sugarlife/features/theory_module/presentation/theory_page.dart';
import 'package:sugarlife/features/widgets/app_scaffold.dart';

final appRoute = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'regicter',
      builder: (context, state) => RegisterScreen(),
    ),
    // После авторизации
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
              builder: (context, state) => const TheoryPage(),
              routes: [
                GoRoute(
                  path: 'module/:moduleId',
                  name: 'theoryModule',
                  builder: (context, state) {
                    final moduleId = int.parse(
                      state.pathParameters['moduleId']!,
                    );
                    return Container();
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
              builder: (context, state) =>
                  GameModuleListProvider(child: const GamePage()),
              routes: [
                GoRoute(
                  path: 'level/:levelId',
                  name: 'gameLevel',
                  builder: (context, state) {
                    final levelId = int.parse(state.pathParameters['levelId']!);
                    return GameModuleLevelProvider(
                      child: GameLevelPage(
                        levelId: levelId,
                        ageCategory: AgeCategory.child,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'question/:questionIndex',
                      name: 'gameLevelQuestion',
                      builder: (context, state) {
                        final levelId = int.parse(
                          state.pathParameters['levelId']!,
                        );
                        final questionIndex = int.parse(
                          state.pathParameters['questionIndex']!,
                        );
                        return Container();
                      },
                    ),
                  ],
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
              builder: (context, state) => const ProfilePage(),
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
        // Если пользователь НЕ авторизован и пытается зайти в защищённую часть
        if (!isLoggedIn &&
            (location == '/game' ||
                location == '/theory' ||
                location == '/profile')) {
          return '/login';
        }
        // В остальных случаях остаёмся на месте
        return null;
      },
    ),
  ],
);
