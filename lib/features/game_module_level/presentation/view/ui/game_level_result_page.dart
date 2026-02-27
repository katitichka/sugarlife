import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

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

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(correctAnswers == 0 ? 'Уровень не пройден!' : 'Уровень пройден!'),
            Text('$correctAnswers/$totalQuestions'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index){
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: AppColors.blue,
                  size: 48,
                );
              },
              )
            ),
            ElevatedButton(onPressed: onFinish, child: Text(correctAnswers == 0 ? 'Пройти заново' : 'Завершить',))
          ],
        ),
      )
    );
  }
}