import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;

  const MainAppBar({
    this.title,
    this.subtitle,
    this.actions,
    this.leading,
    this.titleFontSize,
    this.titleFontWeight,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.blue,
      iconTheme: IconThemeData(color: iconColor ?? AppColors.background),
      title: (title != null || subtitle != null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: GoogleFonts.rubik(
                      fontSize: titleFontSize ?? 24,
                      fontWeight: titleFontWeight ?? FontWeight.w700,
                      color: titleColor ?? AppColors.background,
                    ),
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: (titleColor ?? AppColors.background),
                    ),
                  ),
              ],
            )
          : null,

      centerTitle: true,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
