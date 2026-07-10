import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/shared/ui/app_inline_error_text.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  String? _emailError;
  String? _passwordError;
  String? _authError;
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
              _emailError = message;
              _isLoading = false;
            });
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 45),
                Text(
                  'Сладкая жизнь',
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Приветствуем Вас!',
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                SvgPicture.asset(
                  'assets/common/login_icon.svg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
                SizedBox(height: 20),
                Text(
                  'Войти в аккаунт',
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  cursorColor: AppColors.background,
                  selectionControls: MaterialTextSelectionControls(),
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
                  selectionControls: MaterialTextSelectionControls(),
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
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Нет аккаунта?',
                          style: GoogleFonts.rubik(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/register'),
                          child: Text(
                            'Зарегистрироваться',
                            style: GoogleFonts.rubik(
                              color: AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                if (_authError != null) AppInlineErrorText(message: _authError!),
                ElevatedButton(
                  onPressed:
                      (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _isLoading)
                      ? null
                      : () async {
                          setState(() {
                            _emailError = _emailController.text.isEmpty
                                ? 'Введите email'
                                : null;
                            _passwordError = _passwordController.text.isEmpty
                                ? 'Введите пароль'
                                : null;
                          });
          
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            return;
                          }
          
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
                          'ВОЙТИ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                _emailController.text.isEmpty ||
                                    _passwordController.text.isEmpty ||
                                    _isLoading
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
      ),
    );
  }
}
