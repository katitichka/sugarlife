import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

class SettingsDialog extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback onEditName;
  final VoidCallback onEditAvatar;

  const SettingsDialog({
    super.key,
    required this.profile,
    required this.onEditName,
    required this.onEditAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {}, // предотвращает закрытие при нажатии на сам диалог
            child: Container(
              margin: const EdgeInsets.only(top: 70),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildDialogItem(
                      onTap: () {
                        Navigator.pop(context);
                        onEditName();
                      },
                      iconPath: 'assets/profile/edit_name.svg',
                      text: 'Изменить имя',
                      textColor: AppColors.blue,
                    ),
                    const Divider(height: 1.5, color: AppColors.blue),
                    _buildDialogItem(
                      onTap: () {
                        Navigator.pop(context);
                        onEditAvatar();
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

  void _showLogoutDialog(BuildContext context) {
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
              context.read<AuthBloc>().add(const AuthEvent.logoutPressed());
            },
            child: const Text('Выйти', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}