import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';

class GameLevelStartLevelPage extends StatelessWidget {
  final int levelId;
  const GameLevelStartLevelPage({required this.levelId, super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameModuleLevelBloc>().state;
    if (state is! ReceiveSuccess) {
      return const SizedBox.shrink();
    }
    final progress = state.progress;
    final questionsCount = state.questions.length;
    return Scaffold(
      appBar: AppBar(title: Text('Уровень $levelId')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80,),
            Text(
              'Уровень $levelId',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Количество вопросов: $questionsCount',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (progress?.isCompleted ?? false) ...[
              Text(
                'Последний результат:',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    index < (progress?.stars ?? 0)
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.blue,
                    size: 40,
                  );
                }),
              ),
              const SizedBox(height: 32),
            ],
            SizedBox(height: 200,),
            Center(
              child: SizedBox(
                width: 220,
                height: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    context.read<GameModuleLevelBloc>().add(
                      GameModuleLevelEvent.startLevel(),
                    );
                  },
                  child: Text(
                    progress?.isCompleted ?? false ? 'Пройти заново' : 'Начать',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
