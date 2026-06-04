import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
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
      body: Column(
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
          SizedBox(height: 14),
          Text(
            correctAnswers == 0 ? 'УРОВЕНЬ НЕ ПРОЙДЕН' : 'УРОВЕНЬ ПРОЙДЕН',
            style: GoogleFonts.rubik(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Lottie.asset(
            _getAnimationPath(),
            width: 220,
            height: 220,
            repeat: true,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: index < stars
                    ? SvgPicture.asset(
                        'assets/common/star_fill.svg',
                        width: 55,
                        height: 55,
                        colorFilter: const ColorFilter.mode(
                          AppColors.blue,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/common/star_border.svg',
                        width: 55,
                        height: 55,
                        colorFilter: const ColorFilter.mode(
                          AppColors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
              );
            }),
          ),
          const SizedBox(height: 80),
          SizedBox(
            height: 70,
            child: ElevatedButton(
              onPressed: onFinish,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
              ),
              child: Text(
                correctAnswers == 0 ? 'Пройти заново' : 'Завершить',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.background,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
