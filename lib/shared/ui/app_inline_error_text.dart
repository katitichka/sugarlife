import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';

/// Единый стиль текста ошибки под полями формы (например, ошибка входа/регистрации).
class AppInlineErrorText extends StatelessWidget {
  final String message;

  const AppInlineErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        message,
        style: GoogleFonts.rubik(
          color: AppColors.error,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
