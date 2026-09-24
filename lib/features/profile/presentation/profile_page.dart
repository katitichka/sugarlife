import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/features/profile/presentation/achievements_sections.dart';
import 'package:sugarlife/features/profile/presentation/settings_dialog.dart';
import 'package:sugarlife/shared/ui/animated_settings_button.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileRepository _profileRepository;

  Future<String>? _avatarFuture;
  int? _avatarIdForFuture;
  Timer? _retryTimer;

  @override
  void initState() {
    super.initState();
    _profileRepository = context.read<ProfileRepository>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AchievementBloc>().add(
          const AchievementEvent.loadAchievements(),
        );
      }
    });
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  void _refreshAvatar() {
    _retryTimer?.cancel();
    setState(() {
      _avatarFuture = null;
      _avatarIdForFuture = null;
    });
  }

  Future<String> _avatarFor(int avatarId) {
    if (_avatarFuture == null || _avatarIdForFuture != avatarId) {
      _avatarIdForFuture = avatarId;
      _avatarFuture = _loadAvatarWithRetry(avatarId);
    }
    return _avatarFuture!;
  }

  Future<String> _loadAvatarWithRetry(int avatarId) async {
    try {
      final url = await _profileRepository.getAvatarUrl(avatarId);
      if (url.isNotEmpty) {
        return url;
      }
      throw Exception('Empty URL');
    } catch (e) {
      if (_avatarIdForFuture == avatarId) {
        _retryTimer?.cancel();
        _retryTimer = Timer(const Duration(seconds: 3), () {
          if (mounted && _avatarIdForFuture == avatarId) {
            setState(() {
              _avatarFuture = null;
            });
          }
        });
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () {
            context.go('/login');
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (profile) => Scaffold(
              backgroundColor: AppColors.blue,
              appBar: MainAppBar(
                actions: [
                  AnimatedSettingsButton(
                    onPressed: () async {
                      await showDialog<void>(
                        context: context,
                        barrierColor: AppColors.modalBarrier,
                        barrierDismissible: true,
                        builder: (_) => SettingsDialog(
                          profile: profile,
                          onAvatarChanged: _refreshAvatar,
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: Center(
                          child: Text(
                            profile.username,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              color: AppColors.background,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 190,
                        height: 190,
                        child: FutureBuilder<String>(
                          key: ValueKey(profile.currentAvatarId),
                          future: _avatarFor(profile.currentAvatarId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: LottieProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError ||
                                !snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                child: Icon(
                                  Icons.error_outline,
                                  color: AppColors.error,
                                  size: 48,
                                ),
                              );
                            }
                            final url = snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.blue,
                                  width: 3,
                                ),
                                color: AppColors.avatarPlaceholderBackground,
                              ),
                              child: ClipOval(
                                child: SvgPicture.network(
                                  url,
                                  width: 190,
                                  height: 190,
                                  fit: BoxFit.contain,
                                  placeholderBuilder: (context) => const Center(
                                    child: LottieProgressIndicator(),
                                  ),
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: AppColors.background,
                                          size: 48,
                                        ),
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'Достижения',
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const AchievementsSection(),
                    ],
                  ),
                ),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
