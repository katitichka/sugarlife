import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/theory_module/presentation/bloc/theory_module_bloc.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class TheoryPage extends StatelessWidget {
  const TheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: MainAppBar(title: 'Теоретический модуль'),
      body: BlocBuilder<TheoryModuleBloc, TheoryModuleState>(
        builder: (BuildContext context, state) {
          switch (state) {
            case ReceiveInProgress():
              return const _LoadingPage();
            case ReceiveFailed(:final message):
              return AppErrorView(
                message: message,
                wrapInScaffold: false,
                onRetry: () => context.read<TheoryModuleBloc>().add(
                  TheoryModuleEvent.receive(),
                ),
              );
            case ReceiveSuccess():
              final modules = state.theoryModules;
              return ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  final Color moduleColor = module.color;
                  return SizedBox(
                    height: 140,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      color: moduleColor,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        title: Text(module.title),
                        subtitle: Text(module.subtitle),
                        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.blue, size: 30,),
                        onTap: () => context.push('/theory/module/${module.id}'),
                      ),
                    ),
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
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

