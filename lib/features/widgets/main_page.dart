import 'package:flutter/material.dart';
import 'package:sugarlife/features/game_module/presentation/view/game_page.dart';
import 'package:sugarlife/features/profile/presentation/profile_page.dart';
import 'package:sugarlife/features/theory_module/presentation/theory_page.dart';
import 'package:sugarlife/features/widgets/app_scaffold.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TheoryPage(),
    const GamePage(),
    const ProfilePage(),
  ];
  
  final myModulesFuture = Supabase.instance.client
      .from('modules')
      .select();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: _currentIndex,
      pages: _pages,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}
