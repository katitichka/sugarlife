import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';

class GameModuleLevelProvider extends StatelessWidget {
  final Widget child;
  const GameModuleLevelProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<GameModuleLevelRepository>.value(
      value: context.read<GameModuleLevelRepository>(),
      child: child,
    );
  }
}