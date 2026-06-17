import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/shared/ui/bottom_island.dart';

class AppScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool showBottomNav;

  const AppScaffold({super.key, required this.navigationShell, required this.showBottomNav});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          navigationShell,
          // Плавающее меню
          if (showBottomNav)
          BottomIsland(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(index),
          ),
        ],
      ),
    );
  }
}
