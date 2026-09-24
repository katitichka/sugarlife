import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/avatars/presentation/view/choose_avatar_page.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/shared/ui/app_snack_bar.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class SettingsDialog extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback onAvatarChanged;

  const SettingsDialog({
    super.key,
    required this.profile,
    required this.onAvatarChanged,
  });

  Future<void> _showEditNameDialog(
    BuildContext context,
    ProfileEntity currentProfile,
  ) async {
    final repository = context.read<ProfileRepository>();
    final authBloc = context.read<AuthBloc>();
    final newUsername = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _EditNameDialog(
        currentUsername: currentProfile.username,
        onSave: repository.updateUsername,
      ),
    );

    if (newUsername == null || !context.mounted) return;

    final updatedProfile = currentProfile.copyWith(username: newUsername);
    authBloc.add(AuthEvent.profileUpdate(newProfile: updatedProfile));
    AppSnackBar.showSuccess(context, 'Имя изменено!');
  }

  void _showLogoutDialog(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
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
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      authBloc.add(const AuthEvent.logoutPressed());
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
                        color: AppColors.danger,
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
    final repository = context.read<ProfileRepository>();
    final authBloc = context.read<AuthBloc>();
    final result = await showDialog<AvatarEntity>(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.modalBarrier,
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
        await repository.updateAvatar(result.id);
        if (!context.mounted) return false;

        final updatedProfile = currentProfile.copyWith(
          currentAvatarId: result.id,
        );
        authBloc.add(AuthEvent.profileUpdate(newProfile: updatedProfile));

        if (context.mounted) {
          AppSnackBar.showSuccess(context, 'Аватар обновлён!');
          onAvatarChanged();
          return true;
        }
      } catch (_) {
        if (context.mounted) {
          AppSnackBar.showError(context, 'Не удалось сохранить изменения');
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var routeTransitionStarted = false;
    var avatarDialogOpen = false;

    void closeSettings() {
      if (routeTransitionStarted || avatarDialogOpen) return;
      routeTransitionStarted = true;
      Navigator.pop(context);
    }

    return GestureDetector(
      onTap: closeSettings,
      child: Material(
        color: AppColors.transparent,
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
                            if (routeTransitionStarted || avatarDialogOpen) {
                              return;
                            }
                            routeTransitionStarted = true;
                            final navigator = Navigator.of(context);
                            final hostContext = navigator.context;
                            navigator.pop();
                            if (hostContext.mounted) {
                              _showEditNameDialog(hostContext, profile);
                            }
                          },
                          iconPath: 'assets/profile/edit_name.svg',
                          text: 'Изменить имя',
                          textColor: AppColors.blue,
                        ),
                        const Divider(height: 1.5, color: AppColors.blue),
                        _buildDialogItem(
                          onTap: () async {
                            if (routeTransitionStarted || avatarDialogOpen) {
                              return;
                            }
                            avatarDialogOpen = true;
                            final result = await _showAvatarSelectionSheet(
                              context,
                              profile,
                            );
                            if (result == true && context.mounted) {
                              routeTransitionStarted = true;
                              Navigator.pop(context);
                            } else {
                              avatarDialogOpen = false;
                            }
                          },
                          iconPath: 'assets/profile/edit_avatar.svg',
                          text: 'Изменить аватар',
                          textColor: AppColors.blue,
                        ),
                        const Divider(height: 1.5, color: AppColors.blue),
                        _buildDialogItem(
                          onTap: () {
                            if (routeTransitionStarted || avatarDialogOpen) {
                              return;
                            }
                            routeTransitionStarted = true;
                            final navigator = Navigator.of(context);
                            final hostContext = navigator.context;
                            navigator.pop();
                            if (hostContext.mounted) {
                              _showLogoutDialog(hostContext);
                            }
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

class _EditNameDialog extends StatefulWidget {
  const _EditNameDialog({required this.currentUsername, required this.onSave});

  final String currentUsername;
  final Future<void> Function(String username) onSave;

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  late final TextEditingController _controller;
  bool _isSaving = false;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentUsername);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _close() {
    if (_isSaving || _isClosing) return;
    _isClosing = true;
    Navigator.pop(context);
  }

  Future<void> _save() async {
    if (_isSaving || _isClosing) return;

    final username = _controller.text.trim();
    if (username.isEmpty) {
      AppSnackBar.showError(context, 'Имя не может быть пустым');
      return;
    }
    if (username == widget.currentUsername) {
      _isClosing = true;
      Navigator.pop(context);
      return;
    }

    setState(() => _isSaving = true);
    try {
      await widget.onSave(username).timeout(const Duration(seconds: 5));
      if (!mounted) return;
      _isClosing = true;
      Navigator.pop(context, username);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      AppSnackBar.showError(
        context,
        'Не удалось изменить имя. Попробуйте ещё раз',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.blue, width: 2),
    );

    return Dialog(
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
              controller: _controller,
              enabled: !_isSaving,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _save(),
              decoration: InputDecoration(
                hintText: 'Введите новое имя',
                filled: true,
                fillColor: AppColors.background,
                hintStyle: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
                contentPadding: const EdgeInsets.all(10),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
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
                  onPressed: _isSaving ? null : _close,
                  style: _dialogButtonStyle(),
                  child: Text(
                    'Отмена',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _isSaving ? null : _save,
                  style: _dialogButtonStyle(),
                  child: SizedBox(
                    width: 82,
                    height: 28,
                    child: Center(
                      child: _isSaving
                          ? const LottieProgressIndicator(size: 28)
                          : Text(
                              'Изменить',
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _dialogButtonStyle() {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
