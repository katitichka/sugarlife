import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/theory_module/data/providers/implementations/theory_module_data_provider_impl.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider.dart';
import 'package:sugarlife/features/theory_module/data/repositories/theory_module_repository_impl.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TheoryModuleProvider extends StatelessWidget {
  final Widget child;

  const TheoryModuleProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TheoryModuleDataProvider>(create: (_) => TheoryModuleDataProviderImpl(Supabase.instance.client)),
        RepositoryProvider<TheoryModuleRepository>(create: (context) => TheoryModuleRepositoryImpl(dataProvider: context.read<TheoryModuleDataProvider>(),)),
    ], 
    child: child);
  }
}
