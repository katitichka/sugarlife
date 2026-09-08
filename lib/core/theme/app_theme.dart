import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final textTheme = GoogleFonts.rubikTextTheme().apply(
      bodyColor: AppColors.blue,
      displayColor: AppColors.blue,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue,
        onPrimary: AppColors.background,
        secondary: AppColors.green,
        onSecondary: AppColors.white,
        error: AppColors.error,
        onError: AppColors.white,
        surface: AppColors.background,
        onSurface: AppColors.blue,
      ),
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.background,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.background,
          disabledBackgroundColor: AppColors.disabledPrimary,
          disabledForegroundColor: AppColors.disabledOnPrimary,
          textStyle: GoogleFonts.rubik(fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.blue,
        hintStyle: GoogleFonts.rubik(color: AppColors.inputHint),
        errorStyle: GoogleFonts.rubik(color: AppColors.danger),
        enabledBorder: _inputBorder(AppColors.blue),
        focusedBorder: _inputBorder(AppColors.blue),
        errorBorder: _inputBorder(AppColors.danger),
        focusedErrorBorder: _inputBorder(AppColors.danger),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.background,
        barrierColor: AppColors.modalBarrier,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.background,
        contentTextStyle: GoogleFonts.rubik(color: AppColors.blue),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.menuSeparator),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.blue,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.blue,
        selectionColor: AppColors.modalBarrier,
        selectionHandleColor: AppColors.blue,
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color, width: 3),
    );
  }
}
