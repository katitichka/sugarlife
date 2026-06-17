import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class BottomIsland extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomIsland({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      child: Center(
        child: Container(
          width: 211,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: _NavItem(
                    iconPath: 'assets/common/theory_menu.svg',
                    index: 0,
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                ),
              ),
              Container(width: 2, height: 32, color: AppColors.menuSeparator),
              Expanded(
                child: Center(
                  child: _NavItem(
                    iconPath: 'assets/common/game_menu.svg',
                    index: 1,
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                ),
              ),
              Container(width: 2, height: 32, color: AppColors.menuSeparator),
              Expanded(
                child: Center(
                  child: _NavItem(
                    iconPath: 'assets/common/profile_menu.svg',
                    index: 2,
                    currentIndex: currentIndex,
                    onTap: onTap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final String iconPath;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isActive ? 1.25 : 1.0,
        child: SvgPicture.asset(
          iconPath,
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}