import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/game_module_level/data/repositories/mock_game_module_level_repository_impl.dart';
import 'package:sugarlife/features/game_module_level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/profile/data/repositories/mock_level_progress_repository.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class GameModuleLevelProvider extends StatelessWidget {
  final Widget child;
  const GameModuleLevelProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<GameModuleLevelRepository>(
      create: (context) => MockGameModuleLevelRepositoryImpl(),
      child: RepositoryProvider<LevelProgressRepository>(create: (context) => MockLevelProgressRepository(),
      child: child,),
    );
  }
}
