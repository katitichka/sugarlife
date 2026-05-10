import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/widgets/animated_loading_dots.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _navigated = false;

  void _tryNavigate(AuthState state) {
    if (_navigated || !mounted) return;
    state.maybeWhen(
      authenticated: (_) {
        _navigated = true;
        context.go('/game');
      },
      unauthenticated: () {
        _navigated = true;
        context.go('/login');
      },
      failure: (_) {
        _navigated = true;
        context.go('/login');
      },
      orElse: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _tryNavigate(context.read<AuthBloc>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => _tryNavigate(state),
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
            const Positioned(
              left: 0,
              right: 0,
              bottom: 120,
              child: Center(
                child: AnimatedLoadingDots(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
