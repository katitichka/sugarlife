import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/router/root_navigator.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/achievement/presentation/view/achievement_reward_dialog.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_level_result_page.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_level_start_level_page.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_question_page.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class GameLevelContentPage extends StatelessWidget {
  final int levelId;
  final int orderIndex;
  final int theoryModuleId;
  const GameLevelContentPage({
    super.key,
    required this.levelId,
    required this.theoryModuleId,
    required this.orderIndex,
  });

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
            final successState = state;
            if (successState.currentIndex == -1) {
              return GameLevelStartLevelPage(
                levelId: levelId,
                orderIndex: orderIndex,
                theoryModuleId: theoryModuleId,
              );
            } else {
              return GameQuestionPage(levelOrderIndex: orderIndex,);
            }
          case AnswerInProgress():
            return GameQuestionPage(levelOrderIndex: orderIndex,);
          case LevelCompleted(
            :final correctAnswers,
            :final totalQuestions,
            :final stars,
            :final unlockedAchievement,
          ):
            return GameLevelResultPage(
              correctAnswers: correctAnswers,
              totalQuestions: totalQuestions,
              stars: stars,
              onFinish: () {
                if (correctAnswers == 0) {
                  context.go('/game/level/$levelId');
                } else {
                  _finishLevelWithAchievementCard(
                    context,
                    unlockedOnThisRun: unlockedAchievement,
                  );
                }
              },
              levelId: levelId,
              orderIndex: orderIndex,
              theoryModuleId: theoryModuleId,
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
    return const Scaffold(
      body: Center(child: LottieProgressIndicator()),
      backgroundColor: AppColors.background,
    );
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

Future<void> _finishLevelWithAchievementCard(
  BuildContext context, {
  AchievementEntity? unlockedOnThisRun,
}) async {
  final achievementBloc = context.read<AchievementBloc>();

  Future<void> showReward(AchievementEntity achievement) async {
    final rootCtx = rootNavigatorKey.currentContext;
    final dialogContext = (rootCtx != null && rootCtx.mounted)
        ? rootCtx
        : context;
    if (!dialogContext.mounted) return;
    await showDialog<void>(
      context: dialogContext,
      barrierDismissible: false,
      builder: (_) => AchievementRewardDialog(achievement: achievement),
    );
  }

  if (unlockedOnThisRun != null) {
    await showReward(unlockedOnThisRun);
    if (!context.mounted) return;
    achievementBloc.add(
      AchievementEvent.markPendingAchievementShown(
        achievementId: unlockedOnThisRun.id,
      ),
    );
    achievementBloc.add(const AchievementEvent.loadAchievements());
    achievementBloc.add(const AchievementEvent.checkPendingAchievement());
    if (!context.mounted) return;
    context.pop(true);
    return;
  }

  final beforeToken = achievementBloc.state.pendingSyncToken;
  achievementBloc.add(const AchievementEvent.checkPendingAchievement());
  try {
    await achievementBloc.stream.firstWhere(
      (s) => s.pendingSyncToken != beforeToken,
    );
  } catch (_) {}

  if (!context.mounted) return;
  final pending = achievementBloc.state.pendingAchievement;
  if (pending != null) {
    await showReward(pending);
    if (!context.mounted) return;
    achievementBloc.add(
      AchievementEvent.markPendingAchievementShown(achievementId: pending.id),
    );
    achievementBloc.add(const AchievementEvent.loadAchievements());
  }

  if (!context.mounted) return;
  context.pop(true);
}
