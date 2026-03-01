import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/profile/data/repositories/shared_prefs_level_progress_repository.dart.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';
import 'package:sugarlife/features/widgets/sweetlife_app.dart';

Future<void> app(SharedPreferences prefs) async {
  runApp(
    RepositoryProvider<LevelProgressRepository>(
      create: (_) => SharedPrefsLevelProgressRepository(prefs),
      child: SweetLifeApp(),
    ),
  );
}