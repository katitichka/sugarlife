import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/achievement/presentation/widgets/achievement_reward_dialog.dart';
import 'package:sugarlife/features/daily_card/presentation/view/daily_card_screen.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';

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

/// Вертикальные и горизонтальные константы карты уровней в [GamePage].
class _GameMapMetrics {
  _GameMapMetrics._();

  static const topPadding = 110.0;
  static const bottomPadding = 70.0;
  static const circleSize = 60.0;
  static const moduleDividerHeight = 40.0;
  static const gapAroundModuleDivider = 10.0;
  static const stackTopMargin = 8.0;
  static const scrollPaddingTop = 50.0;
  static const scrollPaddingBottom = 60.0;

  /// Доп. высота контента Stack (как в исходной формуле `contentHeight`).
  static const contentHeightExtra = 50.0;
  static const dividerHorizontalInset = 16.0;

  /// Высота блока «отступ — дивайдер — отступ» над верхом круга.
  static double get dividerBlockAboveCircle =>
      gapAroundModuleDivider * 2 + moduleDividerHeight;

  /// Доп. вертикальный зазор на границе зигзага 4→1 относительно шага [LevelPositionCalculator.stepY].
  static double get moduleExtraGap =>
      circleSize +
      gapAroundModuleDivider +
      moduleDividerHeight +
      gapAroundModuleDivider -
      LevelPositionCalculator.stepY;
}

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

  /// Снизу вверх: сортировка по theory, затем по order.
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
    if (orderedLevels.isEmpty) {
      return const SizedBox.shrink();
    }

    // Порядковый номер модуля для подписи (1, 2, …), не id из БД.
    final displayModuleByTheoryId = <int, int>{};
    var nextDisplay = 1;
    for (final level in orderedLevels) {
      displayModuleByTheoryId.putIfAbsent(level.theoryModuleId, () {
        return nextDisplay++;
      });
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final centerX = MediaQuery.of(context).size.width / 2;
    const calculator = LevelPositionCalculator();

    positions = List.generate(
      orderedLevels.length,
      (i) => calculator.calculatePosition(i, screenHeight, centerX),
    );

    // Сдвиг Y после каждого полного зигзага (4→1): доп. место под дивайдер.
    var cycleBreaks = 0;
    final adjustedYs = <double>[];
    for (var i = 0; i < orderedLevels.length; i++) {
      if (i > 0 && i % 4 == 0) {
        cycleBreaks++;
      }
      adjustedYs.add(
        positions[i].dy - cycleBreaks * _GameMapMetrics.moduleExtraGap,
      );
    }

    final minY = adjustedYs.reduce((a, b) => a < b ? a : b);
    final maxY = adjustedYs.reduce((a, b) => a > b ? a : b);

    final baseLevelTop = List<double>.generate(
      orderedLevels.length,
      (i) => _GameMapMetrics.topPadding + adjustedYs[i] - minY,
    );

    final lastIndex = orderedLevels.length - 1;
    var topShift = 0.0;
    final rawTopDividerTop =
        baseLevelTop[lastIndex] - _GameMapMetrics.dividerBlockAboveCircle;
    if (rawTopDividerTop < _GameMapMetrics.stackTopMargin) {
      topShift = _GameMapMetrics.stackTopMargin - rawTopDividerTop;
    }

    final children = <Widget>[];

    void addHorizontalModuleDivider(double top, int displayModuleNumber) {
      children.add(
        Positioned(
          top: top,
          left: _GameMapMetrics.dividerHorizontalInset,
          right: _GameMapMetrics.dividerHorizontalInset,
          child: SizedBox(
            height: _GameMapMetrics.moduleDividerHeight,
            child: _ModuleDivider(displayModuleNumber: displayModuleNumber),
          ),
        ),
      );
    }

    for (var i = 0; i < orderedLevels.length; i++) {
      final pos = positions[i];
      final levelTop = baseLevelTop[i] + topShift;
      final level = orderedLevels[i];

      final bool isAccessible;
      if (i == 0) {
        isAccessible = true;
      } else {
        final prevId = orderedLevels[i - 1].id;
        final p = progressMap[prevId];
        isAccessible = p != null && p.isCompleted == true;
      }

      final circleColor = progressMap[level.id]?.isCompleted == true
          ? AppColors.green
          : (isAccessible ? AppColors.blue : AppColors.grey);

      children.add(
        Positioned(
          left: pos.dx,
          top: levelTop,
          child: SizedBox(
            width: _GameMapMetrics.circleSize,
            height: _GameMapMetrics.circleSize,
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
                      if (!mounted) return;
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
              child: Center(child: Text('${level.orderIndex}')),
            ),
          ),
        ),
      );
      //TODO
      if (i > 0 && i % 4 == 0) {
        final prevLevelTop = baseLevelTop[i - 1] + topShift;
        final dividerTop =
            prevLevelTop +
            _GameMapMetrics.circleSize +
            _GameMapMetrics.gapAroundModuleDivider;
        final display = displayModuleByTheoryId[level.theoryModuleId]!;
        addHorizontalModuleDivider(dividerTop, display);
      }
    }

    final lastLevelTop = baseLevelTop[lastIndex] + topShift;
    addHorizontalModuleDivider(
      lastLevelTop - _GameMapMetrics.dividerBlockAboveCircle,
      displayModuleByTheoryId[orderedLevels[lastIndex].theoryModuleId]!,
    );

    final contentHeight =
        maxY -
        minY +
        _GameMapMetrics.topPadding +
        _GameMapMetrics.bottomPadding +
        _GameMapMetrics.contentHeightExtra +
        topShift;
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 60),
            child: SizedBox(
              height: contentHeight,
              child: Stack(children: children),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: IconButton(
            icon: Image.asset(
              'assets/icons/daily1.png',
              width: 92,
              height: 52,
              fit: BoxFit.contain,
            ), //TODO: сделать svg 
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const DailyCardScreen(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ModuleDivider extends StatelessWidget {
  const _ModuleDivider({required this.displayModuleNumber});

  final int displayModuleNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.white, thickness: 1.5, endIndent: 12),
        ),
        Text(
          'Модуль $displayModuleNumber',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.white, thickness: 1.5, indent: 12),
        ),
      ],
    );
  }
}
