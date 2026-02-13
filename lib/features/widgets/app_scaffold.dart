import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/widgets/bottom_island.dart';

class AppScaffold extends StatelessWidget {
  final int currentIndex;
  final List<Widget> pages;
  final ValueChanged<int> onTap;

  const AppScaffold({super.key,required this.currentIndex, required this.pages, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Контент страницы
          IndexedStack(index: currentIndex, children: pages),

          // Плавающее меню
          BottomIsland(
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
