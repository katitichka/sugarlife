import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/game_module_list/data/repositories/mock_game_module_list_repository_impl.dart';
import 'package:sugarlife/features/game_module_list/domain/repositories/game_module_list_repository.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

class GameModuleListProvider extends StatelessWidget {
  final Widget child;
  const GameModuleListProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameModuleListBloc(
        gameModuleListRepository: MockGameModuleListRepositoryImpl(),
        gameProgressRepository: context.read<LevelProgressRepository>(),
      )..add(GameModuleListEvent.receive()),
      child: child,
    );
  }
}
