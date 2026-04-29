import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';
import 'package:sugarlife/features/characters/presentation/ui/choose_character_page.dart';
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
  @override
  void initState() {
    _usernameController = TextEditingController();
    _profileRepository = context.read<ProfileRepository>();
    super.initState();
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
                  final updatedProfile = currentProfile.copyWith(
                    username: newUsername,
                  );
                  context.read<AuthBloc>().add(
                    AuthEvent.profileUpdate(newProfile: updatedProfile),
                  );
                  _usernameController.clear();
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Ошибка: $e')));
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
    final result = await showDialog<CharacterEntity>(
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
            child: ChooseCharacterPage(
              currentAvatarId: currentProfile.currentAvatarId,
            ),
          ),
        ),
      ),
    );
    if (result != null && result is CharacterEntity) {
      try {
        await _profileRepository.updateAvatar(result.id);
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
              body: Center(
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
                    FutureBuilder(
                      future: _profileRepository.getAvatarUrl(
                        profile.currentAvatarId,
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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
