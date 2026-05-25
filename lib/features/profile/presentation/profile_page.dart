import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/avatars/presentation/view/choose_avatar_page.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
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
  late final TextEditingController _usernameController;
  late final ProfileRepository _profileRepository;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
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
    _usernameController.dispose();
    super.dispose();
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
                    onPressed: () => showDialog(
                      context: context,
                      barrierColor: Colors.black.withValues(alpha: 0.6),
                      barrierDismissible: true,
                      builder: (_) => SettingsDialog(profile: profile),
                    ),
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
                      Text(
                        profile.username,
                        style: GoogleFonts.rubik(
                          color: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 190,
                        height: 190,
                        child: FutureBuilder<String>(
                          future: _profileRepository.getAvatarUrl(
                            profile.currentAvatarId,
                          ),
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
                                  color: Colors.white,
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
                                color: const Color(0xFFF5F5DC),
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
                                          color: Colors.white,
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
                            color: AppColors.white,
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
