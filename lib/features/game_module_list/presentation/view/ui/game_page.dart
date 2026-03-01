import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_result_page.dart';
import 'package:sugarlife/features/game_module_list/domain/entities/game_module_list_entity.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<Offset> positions;
  final ScrollController _scrollController = ScrollController();


@override
void didChangeDependencies() {
  super.didChangeDependencies();
  // Проверяем, что страница активна
  if (ModalRoute.of(context)?.isCurrent == true) {
    context.read<GameModuleListBloc>().add(GameModuleListEvent.receive());
  }
}
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameModuleListBloc, GameModuleListState>(
      builder: (context, state) {
        // Сначала проверяем новое состояние
        if (state is LevelJustCompleted) {
          return GameLevelResultPage(
            correctAnswers: state.correctAnswers,
            totalQuestions: state.totalQuestions,
            stars: state.stars,
            onFinish: () {
              // После завершения возвращаемся к списку уровней
              context.read<GameModuleListBloc>().add(
                GameModuleListEvent.receive(),
              );
              context.go('/game');
            },
          );
        }

        if (state is ReceiveSuccess) {
          return _buildGameContent(state.levels, state.progressMap);
        }

        if (state is ReceiveInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ReceiveFailed) {
          return Center(child: Text('Ошибка: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildGameContent(
    List<GameModuleListEntity> levels,
    Map<int, LevelProgressEntity> progressMap,
  ) {
    int topPadding = 50;
    int bottomPadding = 70;
    double screenHeight = MediaQuery.of(context).size.height;
    double startY = screenHeight;
    double centerX = MediaQuery.of(context).size.width / 2;
    double circleSize = 60;
    final calculator = LevelPositionCalculator();
    positions = List.generate(
      levels.length,
      (index) => calculator.calculatePosition(index, startY, centerX),
    );

    double minY = positions.map((p) => p.dy).reduce((a, b) => a < b ? a : b);
    double maxY = positions.map((p) => p.dy).reduce((a, b) => a > b ? a : b);
    double contentHeight = maxY - minY + topPadding + bottomPadding;

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 0,
          right: 0,
          top: 50,
          bottom: 60,
        ),
        child: SizedBox(
          height: contentHeight,
          child: Stack(
            children: positions.asMap().entries.map((entry) {
              int index = entry.key;
              Offset pos = entry.value;
              final level = levels[index];
              bool isAccessible;
              if (index == 0) {
                isAccessible = true;
              } else {
                final prevLevelId = levels[index - 1].id;
                final prevProgress = progressMap[prevLevelId];
                if (prevProgress != null && prevProgress.isCompleted == true) {
                  isAccessible = true;
                } else {
                  isAccessible = false;
                }
              }
              Color circleColor;
              if (progressMap[level.id]?.isCompleted == true) {
                circleColor = AppColors.green;
              } else if (isAccessible) {
                circleColor = AppColors.blue;
              } else {
                circleColor = AppColors.grey;
              }
              return Positioned(
                left: pos.dx,
                top: pos.dy - minY,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                  child: ElevatedButton(
                    onPressed: isAccessible
                        ? () => context.push('/game/level/${level.id}')
                        : null,
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class LevelPositionCalculator {
  static int stepX = 80;
  static int stepY = 100;
  const LevelPositionCalculator();
  Offset calculatePosition(int index, double startY, double centerX) {
    double x;
    int remainder = index % 4;

    if (remainder == 0) {
      x = centerX - stepX;
    } else if (remainder == 1) {
      x = centerX;
    } else if (remainder == 2) {
      x = centerX + stepX;
    } else {
      x = centerX;
    }

    double y = startY - index * stepY;
    return Offset(x, y);
  }
}
