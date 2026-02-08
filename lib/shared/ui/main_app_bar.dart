import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const MainAppBar({required this.title, super.key, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: AppColors.navActive,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff4B4E51)),
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
