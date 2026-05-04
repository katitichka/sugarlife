import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_level_content_page.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class GameLevelPage extends StatelessWidget {
  final int levelId;
  const GameLevelPage({required this.levelId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameModuleLevelBloc(
        gameModuleLevelRepository: context.read<GameModuleLevelRepository>(),
        gameModuleLevelListRepository: context
            .read<GameModuleLevelListRepository>(),
        levelProgressRepository: context.read<LevelProgressRepository>(),
        gameModuleListBloc: context.read<GameModuleListBloc>(),
        achievementRepository: context.read<AchievementRepository>(),
      )..add(GameModuleLevelEvent.receive(levelId: levelId)),
      child: GameLevelContentPage(levelId: levelId),
    );
  }
}
