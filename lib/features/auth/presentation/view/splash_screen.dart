import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:sugarlife/core/utils/precache_game_map_assets.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/shared/ui/animated_loading_dots.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _navigated = false;
  bool _isAuthenticated = false;
  bool _areGameAssetsReady = false;
  bool _isPreparingGame = false;
  String? _gameLoadingError;

  void _handleAuthState(AuthState state) {
    if (_navigated || !mounted) return;
    state.maybeWhen(
      authenticated: (_) {
        _isAuthenticated = true;
        _prepareGame();
      },
      unauthenticated: () {
        _navigated = true;
        context.go('/login');
      },
      orElse: () {},
    );
  }

  Future<void> _prepareGame() async {
    if (_isPreparingGame || !mounted) return;
    _isPreparingGame = true;
    _gameLoadingError = null;

    final gameBloc = context.read<GameModuleListBloc>();
    if (gameBloc.state is! ReceiveSuccess &&
        gameBloc.state is! ReceiveInProgress) {
      gameBloc.add(const GameModuleListEvent.receive());
    }

    try {
      await precacheGameMapAssets(context);
      if (!mounted) return;
      _areGameAssetsReady = true;
      _tryOpenGame();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _gameLoadingError = 'Не удалось подготовить игровой экран';
      });
    } finally {
      _isPreparingGame = false;
    }
  }

  void _handleGameState(GameModuleListState state) {
    if (!mounted || _navigated) return;

    if (state is ReceiveFailed) {
      setState(() => _gameLoadingError = state.message);
      return;
    }
    if (state is ReceiveSuccess) {
      _tryOpenGame();
    }
  }

  void _tryOpenGame() {
    if (_navigated ||
        !_isAuthenticated ||
        !_areGameAssetsReady ||
        context.read<GameModuleListBloc>().state is! ReceiveSuccess) {
      return;
    }

    _navigated = true;
    context.go('/game');
  }

  void _retryGameLoading() {
    setState(() => _gameLoadingError = null);
    context.read<GameModuleListBloc>().add(const GameModuleListEvent.receive());
    if (!_areGameAssetsReady) {
      _prepareGame();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _handleAuthState(context.read<AuthBloc>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) => _handleAuthState(state),
        ),
        BlocListener<GameModuleListBloc, GameModuleListState>(
          listener: (context, state) => _handleGameState(state),
        ),
      ],
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/splash_background.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (_, __, ___) => ColoredBox(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Text(
                'Сладкая Жизнь',
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: 55,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 80,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    failure: (message) => AppErrorView(
                      message: message,
                      onRetry: () => context.read<AuthBloc>().add(
                        const AuthEvent.authCheckStarted(),
                      ),
                    ),
                    orElse: () {
                      final gameError = _gameLoadingError;
                      if (gameError != null) {
                        return AppErrorView(
                          message: gameError,
                          onRetry: _retryGameLoading,
                        );
                      }
                      return const Center(
                        child: AnimatedLoadingDots(color: AppColors.white),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
