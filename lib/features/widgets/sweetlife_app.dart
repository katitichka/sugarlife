import 'package:flutter/material.dart';
import 'package:sugarlife/core/router/app_router.dart';

class SweetLifeApp extends StatelessWidget {
  const SweetLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'СладкаяЖизнь',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}
