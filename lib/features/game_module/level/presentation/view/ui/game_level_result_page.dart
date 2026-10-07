import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:lottie/lottie.dart';

class GameLevelResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int stars;
  final VoidCallback onFinish;
  final int levelId;
  final int orderIndex;
  final int theoryModuleId;

  const GameLevelResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.stars,
    required this.onFinish,
    required this.levelId,
    required this.orderIndex,
    required this.theoryModuleId,
    super.key,
  });

  String _getAnimationPath() {
    if (correctAnswers == 0) {
      return 'assets/animations/bad.json';
    }
    switch (stars) {
      case 1:
        return 'assets/animations/bad.json';
      case 2:
        return 'assets/animations/normal.json';
      case 3:
        return 'assets/animations/good.json';
      default:
        return 'assets/animations/bad.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final animationSize = math.min(
            260.0,
            math.max(150.0, constraints.maxHeight * 0.32),
          );
          final compactHeight = constraints.maxHeight < 650;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 640,
                  minHeight: math.max(0, constraints.maxHeight - 32),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Уровень $orderIndex',
                      style: GoogleFonts.rubik(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'модуль $theoryModuleId',
                      style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      correctAnswers == 0
                          ? 'УРОВЕНЬ НЕ ПРОЙДЕН'
                          : 'УРОВЕНЬ ПРОЙДЕН',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Lottie.asset(
                      _getAnimationPath(),
                      width: animationSize,
                      height: animationSize,
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 6),
                    LayoutBuilder(
                      builder: (context, starConstraints) {
                        final starSize = ((starConstraints.maxWidth - 40) / 3)
                            .clamp(36.0, 68.0);
                        return Wrap(
                          spacing: 20,
                          alignment: WrapAlignment.center,
                          children: List.generate(3, (index) {
                            return SvgPicture.asset(
                              index < stars
                                  ? 'assets/common/star_fill.svg'
                                  : 'assets/common/star_border.svg',
                              width: starSize,
                              height: starSize,
                              colorFilter: const ColorFilter.mode(
                                AppColors.blue,
                                BlendMode.srcIn,
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    SizedBox(height: compactHeight ? 24 : 56),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 230,
                        maxWidth: 360,
                      ),
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: onFinish,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              correctAnswers == 0
                                  ? 'Пройти заново'
                                  : 'Завершить',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: AppColors.background,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
