import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Тесты',
          style: TextStyle(color: AppColors.mainTextColor, fontSize: 24),
        ),
      ),
    );
  }
}
