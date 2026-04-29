import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

class TheoryModuleProvider extends StatelessWidget {
  final Widget child;

  const TheoryModuleProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<TheoryModuleRepository>.value(
      value: context.read<TheoryModuleRepository>(),
      child: child,
    );
  }
}
