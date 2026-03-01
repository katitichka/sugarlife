import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_result_page.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_start_level_page.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_question_page.dart';

class GameLevelContentPage extends StatelessWidget {
  final int levelId;
  const GameLevelContentPage({required this.levelId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameModuleLevelBloc, GameModuleLevelState>(
      builder: (context, state) {
        switch (state) {
          case ReceiveInProgress():
            return const _LoadingPage();
          case ReceiveFailed(:final message):
            return _ErrorPage(message: message);
          case ReceiveSuccess():
            if (state.currentIndex == -1 &&
                state.progress?.isCompleted == true && (state.progress?.stars ?? 0) > 0) {
                  /// Уровень уже пройден - показывается страница прогресса
              return GameLevelStartLevelPage(
                levelId: levelId,
              );
            } else if (state.currentIndex == -1) {
              // Уровень не начат или не пройден
              return GameLevelStartLevelPage(levelId: levelId);
            } else {
              // Идёт прохождение
              return GameQuestionPage();
            }
          case AnswerInProgress():
            return GameQuestionPage();
          case LevelCompleted(
            :final correctAnswers,
            :final totalQuestions,
            :final stars,
          ):
          /// Только что прошли уровень - показывается страница результатов
            return GameLevelResultPage(
              correctAnswers: correctAnswers,
              totalQuestions: totalQuestions,
              stars: stars,
              onFinish: () {
                if (correctAnswers == 0) {
                  // Перезапустить текущий уровень
                  context.go('/game/level/$levelId');
                } else {
                  // Перейти на главный экран
                  context.go('/game');
                }
              },
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _ErrorPage extends StatelessWidget {
  final String message;
  const _ErrorPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Ошибка: $message')));
  }
}

// class _StartPage extends StatelessWidget {
//   const _StartPage();

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Стартовый экран'),
//       ),
//     );
//   }
// }
