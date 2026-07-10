import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class TheoryScreenPage extends StatelessWidget {
  final int moduleId;
  const TheoryScreenPage({required this.moduleId, super.key});

  Color mixWithBlack(Color color, [double amount = 0.1]) {
    return Color.lerp(color, Colors.black, amount)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel_outlined),
            color: AppColors.blue,
            iconSize: 45,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: BlocBuilder<TheoryModuleBloc, TheoryModuleState>(
        builder: (context, state) {
          switch (state) {
            case ReceiveInProgress():
              return const Center(child: LottieProgressIndicator());
            case ReceiveFailed(:final message):
              return Center(
                child: AppErrorView(
                  message: message,
                  onRetry: () => context.read<TheoryModuleBloc>().add(
                    const TheoryModuleEvent.receive(),
                  ),
                ),
              );
            case ReceiveSuccess():
              final module = _findModuleById(state.theoryModules, moduleId);
              if (module == null) {
                return const Center(child: Text('Модуль не найден'));
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: mixWithBlack(module.color, 0.1),
                            offset: const Offset(3, 3),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide.none,
                        ),
                        color: module.color,
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                right: 80,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: Text(
                                    module.title,
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: -5,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(24),
                                  ),
                                  child: SizedBox(
                                    width: 80,
                                    height: 50,
                                    child: SvgPicture.asset(
                                      'assets/modules/theory_characters/character_module$moduleId.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/modules/theory/module$moduleId.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Text('Изображение не найдено'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Center(child: LottieProgressIndicator());
          }
        },
      ),
    );
  }

  TheoryModuleEntity? _findModuleById(
    List<TheoryModuleEntity> modules,
    int id,
  ) {
    for (final module in modules) {
      if (module.id == id) {
        return module;
      }
    }
    return null;
  }
}
