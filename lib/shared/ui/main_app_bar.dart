import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? backgroundColor;

  const MainAppBar({
    this.title,
    super.key,
    this.actions,
    this.leading,
    this.titleFontSize,
    this.titleFontWeight,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.blue,
      iconTheme: const IconThemeData(color: AppColors.white),
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.rubik(
                fontSize: titleFontSize ?? 24,
                fontWeight: titleFontWeight ?? FontWeight.w700,
                color: AppColors.white,
              ),
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
