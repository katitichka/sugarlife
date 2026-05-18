import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/avatars/presentation/view/choose_avatar_page.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/shared/ui/achievement_image.dart';
import 'package:sugarlife/shared/ui/app_snackbar.dart';
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
    _usernameController = TextEditingController();
    _profileRepository = context.read<ProfileRepository>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context.read<AchievementBloc>().add(
        const AchievementEvent.loadAchievements(),
      );
    });
  }

  void _showEditNameDialog(ProfileEntity currentProfile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Изменить имя'),
        content: TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Введите новое имя',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () async {
              final newUsername = _usernameController.text.trim();
              if (newUsername.isNotEmpty) {
                try {
                  await _profileRepository.updateUsername(newUsername);
                  if (!context.mounted) return;
                  final updatedProfile = currentProfile.copyWith(
                    username: newUsername,
                  );
                  context.read<AuthBloc>().add(
                    AuthEvent.profileUpdate(newProfile: updatedProfile),
                  );
                  _usernameController.clear();
                  Navigator.pop(context);
                } catch (e) {
                  if (!context.mounted) return;
                  showAppErrorSnackBar(context, e);
                }
              }
            },
            child: Text('Изменить'),
          ),
        ],
      ),
    );
  }

  void _showAvatarSelectionSheet(ProfileEntity currentProfile) async {
    final result = await showDialog<AvatarEntity>(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(44),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ChooseAvatarPage(
              currentAvatarId: currentProfile.currentAvatarId,
            ),
          ),
        ),
      ),
    );
    if (result != null) {
      try {
        await _profileRepository.updateAvatar(result.id);
        if (!mounted) return;
        final updatedProfile = currentProfile.copyWith(
          currentAvatarId: result.id,
        );
        context.read<AuthBloc>().add(
          AuthEvent.profileUpdate(newProfile: updatedProfile),
        );
        if (mounted) {
          showAppSuccessSnackBar(context, 'Аватар обновлён!');
        }
      } catch (e) {
        if (mounted) {
          showAppErrorSnackBar(context, e);
        }
      }
    }
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
                title: 'Профиль',
                leading: IconButton(
                  icon: const Icon(Icons.settings),
                  color: AppColors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Настройки'),
                        content: const Text('Что вы хотите изменить?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _showEditNameDialog(profile);
                            },
                            child: const Text('Имя'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _showAvatarSelectionSheet(profile);
                            },
                            child: const Text('Аватар'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Отмена'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    color: AppColors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Выход'),
                          content: const Text('Вы уверены, что хотите выйти?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Отмена'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                context.read<AuthBloc>().add(
                                  const AuthEvent.logoutPressed(),
                                );
                              },
                              child: const Text('Выйти'),
                            ),
                          ],
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
                      Text(
                        profile.username,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: FutureBuilder<String>(
                          future: _profileRepository.getAvatarUrl(
                            profile.currentAvatarId,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
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
                              ),// TODO
                              child: ClipOval(
                                child: SvgPicture.network(
                                  url,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  placeholderBuilder: (context) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
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
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Достижения',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<AchievementBloc, AchievementState>(
                        builder: (context, achievementState) {
                          final achievements = achievementState.achievements;
                          final itemCount = achievements.isEmpty
                              ? 3
                              : achievements.length;
                          return SizedBox(
                            height: 66,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: itemCount,
                              itemBuilder: (context, index) {
                                if (achievements.isEmpty) {
                                  return _AchievementPlaceholderCard();
                                }

                                final achievement = achievements[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: _AchievementIcon(
                                      url: achievement.imageUrl,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
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

class _AchievementPlaceholderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          'assets/achievements/placeholder.png',
          width: 58,
          height: 58,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  const _AchievementIcon({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return AchievementImage(
      imageUrl: url,
      width: 58,
      height: 58,
      fit: BoxFit.cover,
    );
  }
}
