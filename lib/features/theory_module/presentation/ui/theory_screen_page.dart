import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class TheoryScreenPage extends StatelessWidget {
  final int moduleId;
  const TheoryScreenPage({required this.moduleId, super.key});

  @override
  Widget build(BuildContext context) {
    final theoryRepository = context.read<TheoryModuleRepository>();
    return Scaffold(
      appBar: MainAppBar(title: 'Модуль ${moduleId - 1}'),
      body: FutureBuilder(
        future: theoryRepository.getModuleById(id: moduleId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Модуль не найден'));
          }
          final module = snapshot.data!;
          final Color moduleColor = module.color;
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
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
                MarkdownBody(
                  data: module.content ?? 'Нет содержимого',
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    // Стиль для заголовков h1 (#)
                    h1: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: moduleColor,
                    ),
                    // Стиль для заголовков h2 (##)
                    h2: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: moduleColor,
                    ),
                    // Стиль для заголовков h3 (###)
                    h3: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: moduleColor,
                    ),
                    // Стиль для обычного текста
                    p: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    // Стиль для списков (маркированных)
                    listBullet: TextStyle(fontSize: 16, color: Colors.black87),
                    // Стиль для жирного текста (**текст**)
                    strong: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    blockSpacing: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
