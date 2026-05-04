import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/achievement/presentation/widgets/achievement_reward_dialog.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<Offset> positions;
  final ScrollController _scrollController = ScrollController();
  bool _isAchievementDialogVisible = false;
  int? _lastHandledAchievementId;

  /// Порядок: снизу вверх — первый уровень сценария, затем следующий (theory → order).
  static List<GameModuleLevelEntity> _orderedLevels(
    List<GameModuleLevelEntity> levels,
  ) {
    final copy = List<GameModuleLevelEntity>.from(levels);
    copy.sort((a, b) {
      final byTheory = a.theoryModuleId.compareTo(b.theoryModuleId);
      if (byTheory != 0) return byTheory;
      return a.orderIndex.compareTo(b.orderIndex);
    });
    return copy;
  }

  void _scrollMapToStart() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      _scrollController.jumpTo(max > 0 ? max : 0);
    });
  }

  Future<void> _showAchievementDialog(AchievementState state) async {
    final achievement = state.pendingAchievement;
    if (achievement == null ||
        _isAchievementDialogVisible ||
        _lastHandledAchievementId == achievement.id) {
      return;
    }

    _isAchievementDialogVisible = true;
    _lastHandledAchievementId = achievement.id;
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) {
      _isAchievementDialogVisible = false;
      return;
    }

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AchievementRewardDialog(achievement: achievement),
    );
    if (!mounted) {
      return;
    }

    context.read<AchievementBloc>().add(
      AchievementEvent.markPendingAchievementShown(
        achievementId: achievement.id,
      ),
    );
    context.read<AchievementBloc>().add(
      const AchievementEvent.loadAchievements(),
    );
    _isAchievementDialogVisible = false;
  }

  @override
  void initState() {
    super.initState();
    positions = const [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<GameModuleListBloc>().add(GameModuleListEvent.receive());
      context.read<AchievementBloc>().add(
        const AchievementEvent.checkPendingAchievement(),
      );
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GameModuleListBloc, GameModuleListState>(
          listenWhen: (previous, current) {
            if (current is! ReceiveSuccess) return false;
            if (previous is! ReceiveSuccess) return true;
            return previous != current;
          },
          listener: (context, state) {
            if (state is ReceiveSuccess) {
              _scrollMapToStart();
            }
          },
        ),
        BlocListener<AchievementBloc, AchievementState>(
          listenWhen: (previous, current) =>
              previous.pendingAchievement?.id != current.pendingAchievement?.id,
          listener: (context, state) {
            _showAchievementDialog(state);
          },
        ),
      ],
      child: BlocBuilder<GameModuleListBloc, GameModuleListState>(
        builder: (context, state) {
          if (state is ReceiveSuccess) {
            return _buildGameContent(state.levels, state.progressMap);
          }

          if (state is ReceiveFailed) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildGameContent(
    List<GameModuleLevelEntity> levels,
    Map<int, LevelProgressEntity> progressMap,
  ) {
    final orderedLevels = _orderedLevels(levels);

    const topPadding = 110.0;
    const bottomPadding = 70.0;
    const circleSize = 60.0;
    const moduleDividerHeight = 40.0;
    const moduleInterLevelGap = 150.0;
    const topModuleLabelGap = 20.0;
    final screenHeight = MediaQuery.of(context).size.height;
    final startY = screenHeight;
    final centerX = MediaQuery.of(context).size.width / 2;
    const calculator = LevelPositionCalculator();
    positions = List.generate(
      orderedLevels.length,
      (index) => calculator.calculatePosition(index, startY, centerX),
    );

    final moduleExtraGap =
        moduleInterLevelGap - LevelPositionCalculator.stepY;
    var passedModuleBreaks = 0;
    final adjustedYs = <double>[];
    for (var index = 0; index < orderedLevels.length; index++) {
      if (index > 0 &&
          orderedLevels[index].theoryModuleId !=
              orderedLevels[index - 1].theoryModuleId) {
        passedModuleBreaks++;
      }
      adjustedYs.add(positions[index].dy - passedModuleBreaks * moduleExtraGap);
    }

    final minY = adjustedYs.reduce((a, b) => a < b ? a : b);
    final maxY = adjustedYs.reduce((a, b) => a > b ? a : b);
    final contentHeight = maxY - minY + topPadding + bottomPadding;
    final children = <Widget>[];

    for (final entry in positions.asMap().entries) {
      final index = entry.key;
      final pos = entry.value;
      final adjustedTop = topPadding + adjustedYs[index] - minY;
      final level = orderedLevels[index];
      final bool isAccessible;
      if (index == 0) {
        isAccessible = true;
      } else {
        final prevLevelId = orderedLevels[index - 1].id;
        final prevProgress = progressMap[prevLevelId];
        isAccessible = prevProgress != null && prevProgress.isCompleted == true;
      }
      final Color circleColor;
      if (progressMap[level.id]?.isCompleted == true) {
        circleColor = AppColors.green;
      } else if (isAccessible) {
        circleColor = AppColors.blue;
      } else {
        circleColor = AppColors.grey;
      }
      final label = '${level.orderIndex}';
      children.add(
        Positioned(
          left: pos.dx,
          top: adjustedTop,
          child: SizedBox(
            width: circleSize,
            height: circleSize,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
                backgroundColor: circleColor,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white70,
                elevation: 2,
              ),
              onPressed: isAccessible
                  ? () async {
                      final achievementBloc = context.read<AchievementBloc>();
                      final result = await context.push(
                        '/game/level/${level.id}',
                      );
                      if (!mounted) {
                        return;
                      }
                      if (result == true) {
                        achievementBloc.add(
                          const AchievementEvent.checkPendingAchievement(),
                        );
                        achievementBloc.add(
                          const AchievementEvent.loadAchievements(),
                        );
                      }
                    }
                  : null,
              child: Center(child: Text(label)),
            ),
          ),
        ),
      );

      final isLastLevelInModule =
          index == orderedLevels.length - 1 ||
          orderedLevels[index + 1].theoryModuleId != level.theoryModuleId;
      if (isLastLevelInModule) {
        final hasNextModule = index < orderedLevels.length - 1;
        final moduleLabelTop = hasNextModule
            ? (() {
                final nextTop = adjustedYs[index + 1] - minY;
                final gapStart = adjustedTop + circleSize;
                final gapEnd = nextTop;
                return gapStart +
                    (gapEnd - gapStart - moduleDividerHeight) / 2;
              })()
            : adjustedTop - topModuleLabelGap - moduleDividerHeight;
        children.add(
          Positioned(
            top: moduleLabelTop,
            left: 16,
            right: 16,
            child: SizedBox(
              height: moduleDividerHeight,
              child: _ModuleDivider(moduleId: level.theoryModuleId),
            ),
          ),
        );
      }
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 50, bottom: 60),
        child: SizedBox(height: contentHeight, child: Stack(children: children)),
      ),
    );
  }
}

class _ModuleDivider extends StatelessWidget {
  const _ModuleDivider({required this.moduleId});

  final int moduleId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.white,
            thickness: 1.5,
            endIndent: 12,
          ),
        ),
        Text(
          'Модуль $moduleId',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.white,
            thickness: 1.5,
            indent: 12,
          ),
        ),
      ],
    );
  }
}

class LevelPositionCalculator {
  static const int stepX = 80;
  static const int stepY = 100;
  const LevelPositionCalculator();
  Offset calculatePosition(int index, double startY, double centerX) {
    final remainder = index % 4;
    final double x;
    if (remainder == 0) {
      x = centerX - stepX;
    } else if (remainder == 1) {
      x = centerX;
    } else if (remainder == 2) {
      x = centerX + stepX;
    } else {
      x = centerX;
    }

    final y = startY - index * stepY;
    return Offset(x, y);
  }
}
