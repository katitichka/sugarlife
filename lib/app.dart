import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/game_module_list/data/repositories/mock_game_module_list_repository_impl.dart';
import 'package:sugarlife/features/game_module_list/domain/repositories/game_module_list_repository.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/data/repositories/shared_prefs_level_progress_repository.dart.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';
import 'package:sugarlife/features/widgets/sweetlife_app.dart';
Future<void> app(SharedPreferences prefs) async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LevelProgressRepository>(
          create: (_) => SharedPrefsLevelProgressRepository(prefs),
        ),
        RepositoryProvider<GameModuleListRepository>(
          create: (_) => MockGameModuleListRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GameModuleListBloc>(
            create: (context) => GameModuleListBloc(
              gameModuleListRepository: context.read<GameModuleListRepository>(),
              gameProgressRepository: context.read<LevelProgressRepository>(),
            )..add(GameModuleListEvent.receive()),
          ),
        ],
        child: SweetLifeApp(),
      ),
    ),
  );
}