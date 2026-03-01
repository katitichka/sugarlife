import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/game_module_level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/features/game_module_level/presentation/view/ui/game_level_content_page.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class GameLevelPage extends StatelessWidget {
  final int levelId;
  final AgeCategory ageCategory;
  const GameLevelPage({
    required this.levelId,
    required this.ageCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => GameModuleLevelBloc(
        gameModuleLevelRepository: context.read<GameModuleLevelRepository>(),
        levelProgressRepository: context.read<LevelProgressRepository>(),
        gameModuleListBloc: context.read<GameModuleListBloc>()
      )..add(GameModuleLevelEvent.receive(levelId: levelId, ageCategory: ageCategory)),
      child: GameLevelContentPage(levelId: levelId,),
    );
  }
}
