import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/features/theory_module/presentation/ui/theory_list_card.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class TheoryPage extends StatefulWidget {
  const TheoryPage({super.key});

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<TheoryModuleBloc>().add(const TheoryModuleEvent.receive());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: MainAppBar(
        title: 'Теоретический модуль',
        titleFontSize: 24,
        titleFontWeight: FontWeight.w700,
      ),
      body: BlocBuilder<TheoryModuleBloc, TheoryModuleState>(
        builder: (BuildContext context, state) {
          switch (state) {
            case ReceiveInProgress():
              return const _LoadingPage();
            case ReceiveFailed(:final message):
              return _ErrorPage(
                message: message,
                onRetry: () {
                  context.read<TheoryModuleBloc>().add(const TheoryModuleEvent.receive());
                },
              );
            case ReceiveSuccess():
              final modules = state.theoryModules;
              if (modules.isEmpty) {
                return const Center(child: Text('Нет доступных модулей'));
              }
              
              return LayoutBuilder(
                builder: (context, constraints) {
                  // Высота: экран - AppBar - BottomNavBar (100)
                  final availableHeight = constraints.maxHeight - 100;
                  // Высота одной карточки ~130
                  final totalHeight = modules.length * 130.0;
                  final needScroll = totalHeight > availableHeight;
                  
                  return Column(
                    children: [
                      SizedBox(
                        height: availableHeight,
                        child: RawScrollbar(
                          controller: _scrollController,
                          thumbVisibility: needScroll,
                          trackVisibility: needScroll,
                          thickness: 4,
                          radius: const Radius.circular(2),
                          thumbColor: AppColors.white.withValues(alpha: 0.8),
                          child: ListView.builder(
                            controller: _scrollController,
                            physics: needScroll 
                                ? const AlwaysScrollableScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            itemCount: modules.length,
                            itemBuilder: (context, index) {
                              final module = modules[index];
                              return TheoryListCard(
                                module: module,
                                moduleId: module.id,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            default:
              return const _LoadingPage();
          }
        },
      ),
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LottieProgressIndicator()));
  }
}

class _ErrorPage extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ErrorPage({
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    print('❌ Ошибка загрузки модулей: $message');
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Не удалось загрузить теоретические модули',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Проверьте подключение к интернету',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            if (onRetry != null)
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Повторить'),
              ),
          ],
        ),
      ),
    );
  }
}