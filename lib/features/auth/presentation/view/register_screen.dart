import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class RegisterScreen extends StatefulWidget {
  final String email;
  final String password;
  const RegisterScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Сладкая жизнь',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.blue,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Приветствуем Вас!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.blue,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.all(8), ),
            )
          ],
        ),
      ),
    );
  }
}
