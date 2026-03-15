import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              Text(
                'Создать аккаунт',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Введите имя',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Введите почту',
                  errorText: _emailError,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                  labelText: 'Введите пароль',
                  errorText: _passwordError,
                ),
              ),
              SizedBox(height: 50),

              ElevatedButton(
                onPressed:
                    (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _isLoading)
                    ? null
                    : () {
                        context.read<AuthBloc>().add(
                          AuthEvent.signUpRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                            username: _nameController.text,
                          ),
                        );
                      },
                child: Text(
                  'Создать',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
