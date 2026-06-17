import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/router/app_router.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';

class SweetLifeApp extends StatefulWidget {
  const SweetLifeApp({super.key});

  @override
  State<SweetLifeApp> createState() => _SweetLifeAppState();
}

class _SweetLifeAppState extends State<SweetLifeApp> {
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(AuthEvent.authCheckStarted());
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'СладкаяЖизнь',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}
