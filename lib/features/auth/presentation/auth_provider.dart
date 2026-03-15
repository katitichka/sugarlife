import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends StatelessWidget {
  final Widget child;
  const AuthProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(Supabase.instance.client),
      child: child,
    );
  }
}
