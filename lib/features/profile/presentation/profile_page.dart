import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Профиль',
          style: TextStyle(color: AppColors.mainTextColor, fontSize: 24),
        ),
      ),
    );
  }
}
