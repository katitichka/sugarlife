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
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _usernameController;
  late final ProfileRepository _profileRepository;
  final ScrollController _achievementsScrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _profileRepository = context.read<ProfileRepository>();
    _achievementsScrollController.addListener(_updateArrowsVisibility);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AchievementBloc>().add(
          const AchievementEvent.loadAchievements(),
        );
      }
    });
  }

  void _updateArrowsVisibility() {
    if (!_achievementsScrollController.hasClients) return;
    setState(() {
      _showLeftArrow = _achievementsScrollController.position.pixels > 0;
      _showRightArrow =
          _achievementsScrollController.position.pixels <
          _achievementsScrollController.position.maxScrollExtent;
    });
  }

  void _showEditNameDialog(ProfileEntity currentProfile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Изменить имя'),
        content: TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: 'Введите новое имя',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () async {
              final newUsername = _usernameController.text.trim();
              if (newUsername.isNotEmpty) {
                try {
                  await _profileRepository.updateUsername(newUsername);
                  if (!mounted) return;
                  final updatedProfile = currentProfile.copyWith(
                    username: newUsername,
                  );
                  context.read<AuthBloc>().add(
                    AuthEvent.profileUpdate(newProfile: updatedProfile),
                  );
                  _usernameController.clear();
                  Navigator.pop(context);
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Ошибка: $e')));
                }
              }
            },
            child: const Text('Изменить'),
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Аватар обновлён!')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Ошибка: $e')));
        }
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _achievementsScrollController.dispose();
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
                        style: GoogleFonts.rubik(
                          color: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                              ),
                              child: ClipOval(
                                child: SvgPicture.network(
                                  url,
                                  width: 190,
                                  height: 190,
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
                      const SizedBox(height: 14),
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
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_showLeftArrow)
                              IconButton(
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: AppColors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  _achievementsScrollController.animateTo(
                                    _achievementsScrollController
                                            .position
                                            .pixels -
                                        200,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                },
                              )
                            else
                              const SizedBox(width: 25),
                            SizedBox(
                              width: 240,
                              height: 90,
                              child: BlocBuilder<AchievementBloc, AchievementState>(
                                builder: (context, achievementState) {
                                  final achievements =
                                      achievementState.achievements;
                                  final displayItems = List.generate(6, (
                                    index,
                                  ) {
                                    if (index < achievements.length) {
                                      return achievements[index];
                                    }
                                    return null;
                                  });
                                  return ListView.builder(
                                    controller: _achievementsScrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: displayItems.length,
                                    itemBuilder: (context, index) {
                                      final achievement = displayItems[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0,
                                        ),
                                        child: SizedBox(
                                          width: 88,
                                          height: 88,
                                          child: Center(
                                            child: achievement != null
                                                ? _AchievementIcon(
                                                    url: achievement.imageUrl,
                                                  )
                                                : _AchievementPlaceholderCard(),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            if (_showRightArrow)
                              IconButton(
                                icon: const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  _achievementsScrollController.animateTo(
                                    _achievementsScrollController
                                            .position
                                            .pixels +
                                        200,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                },
                              )
                            else
                              const SizedBox(width: 25),
                          ],
                        ),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SvgPicture.asset(
        'assets/achievements/plug.svg',
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  const _AchievementIcon({required this.url});

  final String url;

  static Widget _placeholder() => SvgPicture.asset(
    'assets/achievements/plug.svg',
    width: 58,
    height: 58,
    fit: BoxFit.contain,
  );

  @override
  Widget build(BuildContext context) {
    if (url.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        url,
        width: 80,
        height: 80,
        fit: BoxFit.contain,
        placeholderBuilder: (_) => _placeholder(),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: 80,
      height: 80,
      fit: BoxFit.contain,
      placeholder: (_, __) => _placeholder(),
      errorWidget: (_, __, ___) => _placeholder(),
    );
  }
}
