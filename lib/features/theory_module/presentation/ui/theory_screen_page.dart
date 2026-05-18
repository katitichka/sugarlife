import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class TheoryScreenPage extends StatelessWidget {
  final int moduleId;
  const TheoryScreenPage({required this.moduleId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Теоретический модуль'),
      backgroundColor: AppColors.white,
      body: BlocBuilder<TheoryModuleBloc, TheoryModuleState>(
        builder: (context, state) {
          switch (state) {
            case ReceiveInProgress():
              return const Center(child: CircularProgressIndicator());
            case ReceiveFailed(:final message):
              return AppErrorView(
                message: message,
                wrapInScaffold: false,
                onRetry: () => context.read<TheoryModuleBloc>().add(
                  TheoryModuleEvent.receive(),
                ),
              );
            case ReceiveSuccess():
              final module = _findModuleById(state.theoryModules, moduleId);
              if (module == null) {
                return const Center(child: Text('Модуль не найден'));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      module.subtitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/modules/module$moduleId.png',
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
              return const Center(child: CircularProgressIndicator());
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