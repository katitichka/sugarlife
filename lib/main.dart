import 'package:flutter/material.dart';
import 'package:sugarlife/features/splash_page/splash_page.dart';
import 'package:sugarlife/main_page.dart';

void main() {
  runApp(const SweetLifeApp());
}

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
