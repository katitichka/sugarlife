import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart'
    as level;
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_result_page.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_start_level_page.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_question_page.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';

class GameLevelContentPage extends StatelessWidget {
  final int levelId;
  const GameLevelContentPage({required this.levelId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<level.GameModuleLevelBloc, level.GameModuleLevelState>(
      builder: (context, state) {
        switch (state) {
          case level.ReceiveInProgress():
            return const _LoadingPage();
          case level.ReceiveFailed(:final message):
            return _ErrorPage(message: message);
          case level.ReceiveSuccess():
            final successState = state as level.ReceiveSuccess;
            if (successState.currentIndex == -1
            // && successState.progress?.isCompleted == true
            ) {
              return GameLevelStartLevelPage(levelId: levelId);
            } else {
              return GameQuestionPage();
            }
          case level.AnswerInProgress():
            return GameQuestionPage();
          case level.LevelCompleted(
            :final correctAnswers,
            :final totalQuestions,
            :final stars,
          ):
            return GameLevelResultPage(
              correctAnswers: correctAnswers,
              totalQuestions: totalQuestions,
              stars: stars,
              onFinish: () {
                if (correctAnswers == 0) {
                  context.go('/game/level/$levelId');
                } else {
                  context.pop(true);
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
