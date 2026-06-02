import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/router/root_navigator.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/achievement/presentation/view/achievement_reward_dialog.dart';
import 'package:sugarlife/features/daily_card/presentation/view/daily_card_screen.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_level_entity.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

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

class _GameMapMetrics {
  _GameMapMetrics._();
  static const topPadding = 50;
  static const bottomPadding = 0;
  static const circleSize = 60.0;
  static const contentHeightExtra = 50.0;
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

  final Map<int, bool> _pressedStates = {};

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
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      final rootCtx = rootNavigatorKey.currentContext;
      final dialogContext = (rootCtx != null && rootCtx.mounted)
          ? rootCtx
          : context;
      if (!dialogContext.mounted) return;
      await showDialog<void>(
        context: dialogContext,
        barrierDismissible: false,
        barrierColor: AppColors.blue.withValues(alpha: 0.4),
        builder: (_) => AchievementRewardDialog(achievement: achievement),
      );
      if (!mounted) return;
      _lastHandledAchievementId = achievement.id;
      context.read<AchievementBloc>().add(
        AchievementEvent.markPendingAchievementShown(
          achievementId: achievement.id,
        ),
      );
      context.read<AchievementBloc>().add(
        const AchievementEvent.loadAchievements(),
      );
    } finally {
      _isAchievementDialogVisible = false;
    }
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
              previous.pendingSyncToken != current.pendingSyncToken,
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
          return const Center(child: LottieProgressIndicator());
        },
      ),
    );
  }

  Future<void> _navigateToLevel(
    int levelId,
    int orderIndex,
    int theoryModuleId,
  ) async {
    final achievementBloc = context.read<AchievementBloc>();
    final result = await context.push(
      '/game/level/${levelId}',
      extra: {'orderIndex': orderIndex, 'theoryModuleId': theoryModuleId},
    );
    ;
    if (!mounted) return;
    if (result == true) {
      achievementBloc.add(const AchievementEvent.checkPendingAchievement());
      achievementBloc.add(const AchievementEvent.loadAchievements());
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 150));
        if (!mounted) return;
        await _showAchievementDialog(context.read<AchievementBloc>().state);
      });
    }
  }

  Widget _getLevelIcon(String assetPath, bool isPressed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: isPressed
          ? Matrix4.translationValues(0, 4, 0)
          : Matrix4.identity(),
      child: SvgPicture.asset(
        assetPath,
        width: _GameMapMetrics.circleSize,
        height: _GameMapMetrics.circleSize,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _getLevelNumberText(int orderIndex, bool isPressed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: isPressed
          ? Matrix4.translationValues(0, 4, 0)
          : Matrix4.identity(),
      child: Container(
        width: _GameMapMetrics.circleSize,
        height: _GameMapMetrics.circleSize,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text(
              '$orderIndex',
              style: GoogleFonts.rubik(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: AppColors.background,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton({
    required int levelId,
    required int orderIndex,
    required int theoryModuleId,
    required bool isAccessible,
    required bool isCompleted,
    required double left,
    required double top,
  }) {
    final isPressed = _pressedStates[levelId] ?? false;

    String assetPath;
    if (isCompleted) {
      assetPath = 'assets/levels/completed_level.svg';
    } else if (isAccessible) {
      assetPath = 'assets/levels/current_level.svg';
    } else {
      assetPath = 'assets/levels/new_level.svg';
    }

    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        width: _GameMapMetrics.circleSize,
        height: _GameMapMetrics.circleSize,
        child: GestureDetector(
          onTapDown: (_) {
            if (!isAccessible) return;
            setState(() {
              _pressedStates[levelId] = true;
            });
          },
          onTapUp: (_) {
            if (!isAccessible) return;
            setState(() {
              _pressedStates[levelId] = false;
            });
            _navigateToLevel(levelId, orderIndex, theoryModuleId);
          },
          onTapCancel: () {
            setState(() {
              _pressedStates[levelId] = false;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Иконка уровня
              _getLevelIcon(assetPath, isPressed),
              // Номер уровня поверх иконки
              _getLevelNumberText(orderIndex, isPressed),
            ],
          ),
        ),
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

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final centerX = screenWidth / 2 - 28;
    const calculator = LevelPositionCalculator();

    positions = List.generate(
      orderedLevels.length,
      (i) => calculator.calculatePosition(i, screenHeight, centerX),
    );

    final minY = positions.map((p) => p.dy).reduce((a, b) => a < b ? a : b);
    final maxY = positions.map((p) => p.dy).reduce((a, b) => a > b ? a : b);

    const bottomOffset = 100.0;
    const topOffset = 80.0;

    final baseLevelTop = List.generate(
      orderedLevels.length,
      (i) => _GameMapMetrics.topPadding + positions[i].dy - minY + bottomOffset,
    );

    final children = <Widget>[];

    int dividerNumber = 1;

    for (var i = 0; i < orderedLevels.length; i++) {
      final pos = positions[i];
      final levelTop = baseLevelTop[i];
      final level = orderedLevels[i];

      if (i > 0 &&
          level.theoryModuleId != orderedLevels[i - 1].theoryModuleId) {
        final prevLevelTop = baseLevelTop[i - 1];
        final dividerY = (prevLevelTop + levelTop) / 2;

        children.add(
          Positioned(
            left: 0,
            right: 0,
            top: dividerY + 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.background,
                    thickness: 1.5,
                    endIndent: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Модуль $dividerNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.background,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.background,
                    thickness: 1.5,
                    indent: 12,
                  ),
                ),
              ],
            ),
          ),
        );
        dividerNumber++;
      }

      final bool isAccessible;
      if (i == 0) {
        isAccessible = true;
      } else {
        final prevId = orderedLevels[i - 1].id;
        final p = progressMap[prevId];
        isAccessible = p != null && (p.stars ?? 0) > 0;
      }

      final isCompleted = progressMap[level.id]?.isCompleted == true;

      children.add(
        _buildLevelButton(
          levelId: level.id,
          orderIndex: level.orderIndex,
          theoryModuleId: level.theoryModuleId,
          isAccessible: isAccessible,
          isCompleted: isCompleted,
          left: pos.dx,
          top: levelTop,
        ),
      );
    }

    if (orderedLevels.isNotEmpty) {
      final lastLevelTop = baseLevelTop[orderedLevels.length - 1];
      final lastDividerY = lastLevelTop + _GameMapMetrics.circleSize - 90;

      children.add(
        Positioned(
          left: 0,
          right: 0,
          top: lastDividerY,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Divider(
                  color: AppColors.background,
                  thickness: 1.5,
                  endIndent: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Модуль $dividerNumber',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.background,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(
                  color: AppColors.background,
                  thickness: 1.5,
                  indent: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final contentHeight =
        maxY -
        minY +
        _GameMapMetrics.topPadding +
        _GameMapMetrics.bottomPadding +
        _GameMapMetrics.contentHeightExtra +
        80 +
        bottomOffset +
        topOffset;

    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: contentHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: -30,
                  bottom: 0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;

                      return FutureBuilder(
                        future: _getSvgSize(
                          'assets/images/repeat_background.svg',
                        ),
                        builder: (context, snapshot) {
                          final repeatHeight = snapshot.data ?? 1280.0;
                          final bottomHeight = 1147.0;

                          final availableHeight = contentHeight - bottomHeight;
                          final repeatCount =
                              (availableHeight / repeatHeight).ceil() + 2;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: repeatCount,
                                  itemBuilder: (context, index) =>
                                      SvgPicture.asset(
                                        'assets/images/repeat_background.svg',
                                        width: w,
                                        fit: BoxFit.fitWidth,
                                      ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/start_background.svg',
                                width: w,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                ...children,
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: IconButton(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/common/daily_icon.svg',
                width: 82,
                height: 45,
                fit: BoxFit.contain,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: AppColors.blue.withValues(alpha: 0.4),
                builder: (_) => const DailyCardScreen(),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<double> _getSvgSize(String assetPath) async {
    return 1280.0;
  }
}
