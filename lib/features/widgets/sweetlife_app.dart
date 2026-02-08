import 'package:flutter/material.dart';
import 'package:sugarlife/features/widgets/main_page.dart';

class SweetLifeApp extends StatelessWidget {
  const SweetLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'СладкаяЖизнь',
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
