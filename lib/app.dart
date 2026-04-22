import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/game_module_list/data/repositories/mock_game_module_list_repository_impl.dart';
import 'package:sugarlife/features/game_module_list/domain/repositories/game_module_list_repository.dart';
import 'package:sugarlife/features/game_module_list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/data/repositories/level_progress_repository_impl.dart';
import 'package:sugarlife/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/features/theory_module/data/providers/implementations/theory_module_data_provider_impl.dart';
import 'package:sugarlife/features/theory_module/data/repositories/theory_module_repository_impl.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/features/widgets/sweet_life_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> app(SupabaseClient supabase) async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LevelProgressRepository>(
          create: (_) => LevelProgressRepositoryImpl(supabase),
        ),
        RepositoryProvider<GameModuleListRepository>(
          create: (_) => MockGameModuleListRepositoryImpl(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(supabase)),
        RepositoryProvider<TheoryModuleRepository>(
          create: (_) => TheoryModuleRepositoryImpl(
            dataProvider: TheoryModuleDataProviderImpl(supabase),
          ),
        ),
        RepositoryProvider<ProfileRepository>(create: (_) => ProfileRepositoryImpl(supabase)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc( authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<GameModuleListBloc>(
            create: (context) => GameModuleListBloc(
              gameModuleListRepository: context.read<GameModuleListRepository>(),
              gameProgressRepository: context.read<LevelProgressRepository>(),
            )..add(GameModuleListEvent.receive()),
          ),
          BlocProvider<TheoryModuleBloc>(
            create: (context) => TheoryModuleBloc(
              theoryModuleRepository: context.read<TheoryModuleRepository>(),
            )..add(TheoryModuleEvent.receive()),
            )
        ],
        child: SweetLifeApp(),
      ),
    ),
  );
}