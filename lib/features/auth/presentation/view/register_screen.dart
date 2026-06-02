import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _authError;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _nameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
              _authError = message;
              _isLoading = false;
            });
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              Text(
                'Сладкая жизнь',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Приветствуем Вас!',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              SvgPicture.asset(
                'assets/common/login_icon.svg',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
              const SizedBox(height: 20),
              Text(
                'Создать аккаунт',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                cursorColor: AppColors.background,
                style: GoogleFonts.rubik(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  hintText: 'Введите имя',
                  hintStyle: GoogleFonts.rubik(
                    color: const Color.fromRGBO(250, 243, 235, 0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: GoogleFonts.rubik(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: _nameController.text.isNotEmpty
                      ? AppColors.background
                      : AppColors.blue,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                cursorColor: AppColors.background,
                style: GoogleFonts.rubik(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  hintText: 'Введите почту',
                  hintStyle: GoogleFonts.rubik(
                    color: const Color.fromRGBO(250, 243, 235, 0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: GoogleFonts.rubik(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: _emailController.text.isNotEmpty
                      ? AppColors.background
                      : AppColors.blue,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                cursorColor: AppColors.background,
                obscureText: true,
                style: GoogleFonts.rubik(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.blue,
                      width: 3,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.red, width: 3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  hintText: 'Введите пароль',
                  hintStyle: GoogleFonts.rubik(
                    color: const Color.fromRGBO(250, 243, 235, 0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: GoogleFonts.rubik(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: _passwordController.text.isNotEmpty
                      ? AppColors.background
                      : AppColors.blue,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Уже есть аккаунт?',
                        style: GoogleFonts.rubik(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          'Войти',
                          style: GoogleFonts.rubik(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            decorationThickness: 2,
                            decorationColor: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              if (_authError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _authError!,
                    style: GoogleFonts.rubik(
                      color: AppColors.error,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ElevatedButton(
                onPressed: (_nameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _isLoading)
                    ? null
                    : () async {
                        setState(() {
                          _nameError = _nameController.text.isEmpty
                              ? 'Введите имя'
                              : null;
                          _emailError = _emailController.text.isEmpty
                              ? 'Введите email'
                              : null;
                          _passwordError = _passwordController.text.isEmpty
                              ? 'Введите пароль'
                              : null;
                          _authError = null;
                        });

                        if (_nameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          return;
                        }

                        context.read<AuthBloc>().add(
                          AuthEvent.signUpRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                            username: _nameController.text,
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_nameController.text.isEmpty ||
                          _emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _isLoading)
                      ? const Color.fromRGBO(64, 153, 219, 0.6)
                      : AppColors.blue,
                  minimumSize: const Size(230, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
                child: _isLoading
                    ? LottieProgressIndicator()
                    : Text(
                        'СОЗДАТЬ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: (_nameController.text.isEmpty ||
                                  _emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty ||
                                  _isLoading)
                              ? const Color.fromRGBO(255, 255, 255, 0.6)
                              : const Color.fromRGBO(250, 243, 235, 1),
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