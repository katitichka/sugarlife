import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:lottie/lottie.dart';

/// Страница, открывающаяся после прохождения уровня, показывает результаты.
class GameLevelResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int stars;
  final VoidCallback onFinish;

  const GameLevelResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.stars,
    required this.onFinish,
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
    print('=== GameLevelResultPage ===');
  print('correctAnswers: $correctAnswers');
  print('stars: $stars');
  
  String animationPath = _getAnimationPath();
  print('animationPath: $animationPath');
  
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              correctAnswers == 0 ? 'Уровень не пройден!' : 'Уровень пройден!',
            ),
            const SizedBox(height: 16),
            Lottie.asset(
              _getAnimationPath(),
              width: 200,
              height: 200,
              repeat: true,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text('$correctAnswers/$totalQuestions'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: AppColors.blue,
                  size: 48,
                );
              }),
            ),
            ElevatedButton(
              onPressed: onFinish,
              child: Text(correctAnswers == 0 ? 'Пройти заново' : 'Завершить'),
            ),
          ],
        ),
      ),
    );
  }
}
