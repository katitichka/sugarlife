import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  String? _serverError;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () => setState(() => _isLoading = false),
          loading: () => setState(() => _isLoading = true),
          authenticated: (_) => context.go('/game'),
          unauthenticated: () => setState(() => _isLoading = false),
          failure: (message) {
            setState(() {
              _serverError = message;
              _isLoading = false;
            });
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              Text(
                'Сладкая жизнь',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                  fontSize: 28,
                  height: 0.9, 
                  
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
                'Войти в аккаунт',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
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
              if (_serverError != null) ...[
                const SizedBox(height: 12),
                Text(
                  _serverError!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red.shade700, fontSize: 14),
                ),
              ],
              SizedBox(height: 50),
              TextButton(
                onPressed: () => context.go('/register'),
                child: Text(
                  'Нет аккаунта? Зарегистрироваться',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.blue,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _isLoading)
                    ? null
                    : () async {
                        // Провека полей
                        setState(() {
                          _emailError = _emailController.text.isEmpty
                              ? 'Введите email'
                              : null;
                          _passwordError = _passwordController.text.isEmpty
                              ? 'Введите пароль'
                              : null;
                          _serverError = null;
                        });

                        // Если есть ошибки — не отправляем
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          return;
                        }

                        // Отправляем событие
                        context.read<AuthBloc>().add(
                          AuthEvent.signInRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _isLoading
                      ? Colors.grey
                      : AppColors.blue,
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Войти',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
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
