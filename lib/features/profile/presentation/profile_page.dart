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
  final PageController _achievementsPageController = PageController();
  int _currentPage = 0;
  int _totalPages = 0;

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
    _achievementsPageController.dispose();
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
                              color: const Color(0xFFF5F5DC),
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
                      BlocBuilder<AchievementBloc, AchievementState>(
                        builder: (context, achievementState) {
                          final achievements = achievementState.achievements;
                          final totalAchievements = achievements.length;
                          _totalPages = (totalAchievements / 3).ceil();
                          if (_totalPages == 0) _totalPages = 1;
                          
                          // Сбрасываем страницу, если текущая стала невалидной
                          if (_currentPage >= _totalPages) {
                            _currentPage = _totalPages - 1;
                            if (_currentPage < 0) _currentPage = 0;
                          }
                          
                          return SizedBox(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Левая стрелка (показываем только если страниц > 1 и не первая страница)
                                if (_totalPages > 1 && _currentPage > 0)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_circle_left,
                                      color: AppColors.white,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      if (_currentPage > 0) {
                                        setState(() {
                                          _currentPage--;
                                        });
                                        _achievementsPageController.animateToPage(
                                          _currentPage,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        );
                                      }
                                    },
                                  )
                                else
                                  const SizedBox(width: 25),
                                
                                // Страницы с достижениями
                                SizedBox(
                                  width: 240,
                                  height: 90,
                                  child: PageView.builder(
                                    controller: _achievementsPageController,
                                    onPageChanged: (page) {
                                      setState(() {
                                        _currentPage = page;
                                      });
                                    },
                                    itemCount: _totalPages,
                                    itemBuilder: (context, pageIndex) {
                                      final startIndex = pageIndex * 3;
                                      final endIndex = startIndex + 3;
                                      final pageAchievements = 
                                          achievements.length > startIndex
                                              ? achievements.sublist(
                                                  startIndex,
                                                  endIndex > achievements.length
                                                      ? achievements.length
                                                      : endIndex,
                                                )
                                              : [];
                                      
                                      // Формируем список из 3 элементов (достижения + заглушки)
                                      final displayItems = List.generate(3, (index) {
                                        if (index < pageAchievements.length) {
                                          return pageAchievements[index];
                                        }
                                        return null;
                                      });
                                      
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(displayItems.length, (index) {
                                          final achievement = displayItems[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2),
                                            child: SizedBox(
                                              width: 90,
                                              height: 80,
                                              child: Center(
                                                child: achievement != null
                                                    ? _AchievementIcon(url: achievement.imageUrl)
                                                    : const _AchievementPlaceholderCard(),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                                
                                // Правая стрелка (показываем только если страниц > 1 и не последняя страница)
                                if (_totalPages > 1 && _currentPage < _totalPages - 1)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_circle_right,
                                      color: AppColors.white,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      if (_currentPage < _totalPages - 1) {
                                        setState(() {
                                          _currentPage++;
                                        });
                                        _achievementsPageController.animateToPage(
                                          _currentPage,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        );
                                      }
                                    },
                                  )
                                else
                                  const SizedBox(width: 25),
                              ],
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
  const _AchievementPlaceholderCard();

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
        fit: BoxFit.cover,
        placeholderBuilder: (_) => _placeholder(),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
      placeholder: (_, __) => _placeholder(),
      errorWidget: (_, __, ___) => _placeholder(),
    );
  }
}