import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/achievement/data/providers/implementations/achievement_data_provider_impl.dart';
import 'package:sugarlife/features/achievement/data/repositories/achievement_repository_impl.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/auth/data/providers/implementations/auth_data_provider_impl.dart';
import 'package:sugarlife/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/game_module/level/data/providers/implementations/game_module_level_data_provider_impl.dart';
import 'package:sugarlife/features/game_module/level/data/providers/implementations/game_module_level_list_data_provider_impl.dart';
import 'package:sugarlife/features/game_module/level/data/repositories/game_module_level_repository_impl.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/game_module/level/data/repositories/game_module_level_list_repository_impl.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/data/providers/implementations/level_progress_data_provider_impl.dart';
import 'package:sugarlife/features/profile/data/providers/implementations/profile_data_provider_impl.dart';
import 'package:sugarlife/features/profile/data/repositories/level_progress_repository_impl.dart';
import 'package:sugarlife/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/features/theory_module/data/providers/implementations/theory_module_data_provider_impl.dart';
import 'package:sugarlife/features/theory_module/data/repositories/theory_module_repository_impl.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/shared/ui/sweet_life_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> app(SupabaseClient supabase) async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppCacheService>(create: (_) => AppCacheService()),
        RepositoryProvider<AchievementRepository>(
          create: (context) => AchievementRepositoryImpl(
            AchievementDataProviderImpl(supabase),
            context.read<AppCacheService>(),
          ),
        ),
        RepositoryProvider<LevelProgressRepository>(
          create: (_) =>
              LevelProgressRepositoryImpl(LevelProgressDataProviderImpl(supabase)),
        ),
        RepositoryProvider<GameModuleLevelListRepository>(
          create: (context) => GameModuleLevelListRepositoryImpl(
            GameModuleLevelListDataProviderImpl(supabase),
            context.read<AppCacheService>(),
          ),
        ),
        RepositoryProvider<GameModuleLevelRepository>(
          create: (context) => GameModuleLevelRepositoryImpl(
            GameModuleLevelDataProviderImpl(supabase),
            context.read<AppCacheService>(),
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            AuthDataProviderImpl(supabase),
            context.read<AppCacheService>(),
          ),
        ),
        RepositoryProvider<TheoryModuleRepository>(
          create: (context) => TheoryModuleRepositoryImpl(
            dataProvider: TheoryModuleDataProviderImpl(),
            cache: context.read<AppCacheService>(),
          ),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepositoryImpl(
            ProfileDataProviderImpl(supabase),
            context.read<AppCacheService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AchievementBloc>(
            create: (context) => AchievementBloc(
              achievementRepository: context.read<AchievementRepository>(),
            ),
          ),
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<GameModuleListBloc>(
            create: (context) => GameModuleListBloc(
              gameModuleLevelListRepository: context
                  .read<GameModuleLevelListRepository>(),
              gameProgressRepository: context.read<LevelProgressRepository>(),
            ),
          ),
          BlocProvider<TheoryModuleBloc>(
            create: (context) => TheoryModuleBloc(
              theoryModuleRepository: context.read<TheoryModuleRepository>(),
            )..add(TheoryModuleEvent.receive()),
          ),
        ],
        child: SweetLifeApp(),
      ),
    ),
  );
}
