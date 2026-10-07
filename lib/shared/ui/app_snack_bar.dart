import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';

/// Единый стиль всплывающих уведомлений (успех/ошибка) во всём приложении.
class AppSnackBar {
  AppSnackBar._();

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _build(
        context: context,
        message: message,
        background: AppColors.backgroundRed,
        textColor: AppColors.error,
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _build(
        context: context,
        message: message,
        background: AppColors.background,
        textColor: AppColors.blue,
      ),
    );
  }

  static SnackBar _build({
    required BuildContext context,
    required String message,
    required Color background,
    required Color textColor,
  }) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final useFixedWidth = screenWidth >= 600;

    return SnackBar(
      content: Text(
        message,
        style: GoogleFonts.rubik(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: background,
      behavior: SnackBarBehavior.floating,
      width: useFixedWidth ? 520 : null,
      margin: useFixedWidth ? null : const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
