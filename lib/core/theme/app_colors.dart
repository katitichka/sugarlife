import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color blue = Color(0xFF4099DB);
  static const Color darkBlue = blue;
  static const Color green = Color(0xFF5CC199);
  static const Color red = Color(0xFFEF4C5E);
  static const Color error = Color(0xFFE94E5E);
  static const Color danger = Color(0xFFF44336);

  static const Color background = Color(0xFFFAF3EB);
  static const Color backgroundGreen = Color(0xFFEEFFE5);
  static const Color backgroundRed = Color(0xFFFFE9E5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color transparent = Color(0x00000000);

  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lighterGrey = Color(0xFFEEEEEE);
  static const Color menuSeparator = Color(0xFFE6E1DB);
  static const Color neutralBorder = Color(0xFFDCD5CD);
  static const Color avatarPlaceholderBackground = Color(0xFFF5F5DC);

  static const Color truth = Color(0xFF65DC86);
  static const Color myth = Color(0xFFF34456);

  static const Color inputHint = Color(0xCCFAF3EB);
  static const Color disabledPrimary = Color(0x994099DB);
  static const Color disabledOnPrimary = Color(0x99FFFFFF);
  static const Color modalBarrier = Color(0x664099DB);
  static const Color primaryTint = Color(0x1A4099DB);
  static const Color blue70 = Color(0xB34099DB);
  static const Color white20 = Color(0x33FFFFFF);
  static const Color white80 = Color(0xCCFFFFFF);

  static Color fromHex(String hex) {
    final normalizedHex = hex.replaceFirst('#', '');
    return Color(int.parse('FF$normalizedHex', radix: 16));
  }
}
