import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';

/// Единый стиль всплывающих уведомлений (успех/ошибка) во всём приложении.
class AppSnackBar {
  AppSnackBar._();

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _build(message: message, background: AppColors.backgroundRed, textColor: AppColors.error),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _build(message: message, background: AppColors.background, textColor: AppColors.blue),
    );
  }

  static SnackBar _build({
    required String message,
    required Color background,
    required Color textColor,
  }) {
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
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
