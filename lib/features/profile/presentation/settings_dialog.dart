import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/avatars/presentation/view/choose_avatar_page.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';

class SettingsDialog extends StatelessWidget {
  final ProfileEntity profile;

  const SettingsDialog({super.key, required this.profile});

  // Диалог изменения имени
  // Диалог изменения имени - обновите метод _showEditNameDialog
void _showEditNameDialog(BuildContext context, ProfileEntity currentProfile) {
  final controller = TextEditingController(text: currentProfile.username);
  final repository = context.read<ProfileRepository>();

  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 44),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Изменить имя',
              style: GoogleFonts.rubik(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Введите новое имя',
                hintStyle: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.blue,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.blue,
                    width: 2,
                  ),
                ),
              ),
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Отмена',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final newUsername = controller.text.trim();
                    if (newUsername.isNotEmpty &&
                        newUsername != currentProfile.username) {
                      try {
                        await repository.updateUsername(newUsername);
                        if (!context.mounted) return;
                        final updatedProfile = currentProfile.copyWith(
                          username: newUsername,
                        );
                        context.read<AuthBloc>().add(
                          AuthEvent.profileUpdate(newProfile: updatedProfile),
                        );
                        if (context.mounted) {
                          Navigator.pop(context); // закрываем диалог
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Имя изменено!',
                                style: GoogleFonts.rubik(
                                  color: AppColors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: AppColors.background,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text('Ошибка: $e'),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      }
                    } else if (newUsername == currentProfile.username) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Имя не может быть пустым'),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Изменить',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

  // Диалог выхода
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выход',
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Вы уверены, что хотите выйти?',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Отмена',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      
                      context.read<AuthBloc>().add(
                        const AuthEvent.logoutPressed(),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Выйти',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
Future<bool> _showAvatarSelectionSheet(
  BuildContext context,
  ProfileEntity currentProfile,
) async {
  final result = await showDialog<AvatarEntity>(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.blue.withValues(alpha: 0.4),
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          child: ChooseAvatarPage(
            currentAvatarId: currentProfile.currentAvatarId,
          ),
        ),
      ),
    ),
  );

  if (result != null) {
    try {
      final repository = context.read<ProfileRepository>();
      await repository.updateAvatar(result.id);
      if (!context.mounted) return false;

      final updatedProfile = currentProfile.copyWith(
        currentAvatarId: result.id,
      );
      context.read<AuthBloc>().add(
        AuthEvent.profileUpdate(newProfile: updatedProfile),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Аватар обновлён!',
              style: GoogleFonts.rubik(
                color: AppColors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.background,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
        return true;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text('Ошибка: $e'),
            backgroundColor: AppColors.red,
          ),
        );
      }
    }
  }
  return false;
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                const SizedBox(height: 70),
                Container(
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildDialogItem(
                          onTap: () {
                            Navigator.pop(context);
                            _showEditNameDialog(context, profile);
                          },
                          iconPath: 'assets/profile/edit_name.svg',
                          text: 'Изменить имя',
                          textColor: AppColors.blue,
                        ),
                        const Divider(height: 1.5, color: AppColors.blue),
                        _buildDialogItem(
                          onTap: () async {
                            final result = await _showAvatarSelectionSheet(
                              context,
                              profile,
                            );
                            if (result == true && context.mounted) {
                              Navigator.pop(
                                context,
                              ); // закрываем SettingsDialog
                            }
                          },
                          iconPath: 'assets/profile/edit_avatar.svg',
                          text: 'Изменить аватар',
                          textColor: AppColors.blue,
                        ),
                        const Divider(height: 1.5, color: AppColors.blue),
                        _buildDialogItem(
                          onTap: () {
                            Navigator.pop(context);
                            _showLogoutDialog(context);
                          },
                          iconPath: 'assets/profile/logout.svg',
                          text: 'Выйти из профиля',
                          textColor: AppColors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialogItem({
    required VoidCallback onTap,
    required String iconPath,
    required String text,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28,
              height: 28,
              colorFilter: textColor != null
                  ? ColorFilter.mode(textColor, BlendMode.srcIn)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? AppColors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
