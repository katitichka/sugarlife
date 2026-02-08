import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final int totalLessons = 28;
  
  // Контроллер для скролла снизу вверх
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    // Прокручиваем к низу после построения (чтобы видно было начало снизу)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          reverse: true, // Это ключевое! Скролл начинается снизу
          slivers: [
            // ПУСТОЕ ПРОСТРАНСТВО СВЕРХУ (чтобы контент был виден снизу)
            SliverToBoxAdapter(
              child: SizedBox(height: 100), // Регулируйте высоту по необходимости
            ),
            
            // КАРТА УРОКОВ (начинается снизу)
            _buildLessonsMap(),
            
            // ОТСТУП СНИЗУ (чтобы не касалось навигации)
            SliverToBoxAdapter(
              child: SizedBox(height: 80), // Отступ от нижней панели
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonsMap() {
    // Для змейки снизу вверх нам нужно инвертировать порядок строк
    List<Widget> rows = [];
    
    // Создаем 7 строк (28 / 4 = 7), но начинаем с "низа" (последней строки)
    for (int rowIndex = 6; rowIndex >= 0; rowIndex--) {
      final bool isEvenRow = rowIndex % 2 == 0; // Определяем направление
      final startIndex = rowIndex * 4;
      
      // Создаем строку с 4 кружками
      List<Widget> circles = [];
      for (int i = 0; i < 4; i++) {
        int lessonNumber = startIndex + i + 1;
        
        // Для змейки: 
        // - Четные строки (при индексации снизу) идут справа налево
        // - Нечетные строки идут слева направо
        if (isEvenRow) {
          // Четные строки (снизу): справа налево
          lessonNumber = startIndex + (4 - i);
        } else {
          // Нечетные строки (снизу): слева направо
          lessonNumber = startIndex + i + 1;
        }
        
        circles.add(_buildLessonCircle(lessonNumber));
      }
      
      // Добавляем строку кружков
      rows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: circles,
          ),
        ),
      );
      
      // Добавляем соединительную линию (кроме самой верхней строки)
      if (rowIndex > 0) {
        rows.add(
          Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      }
    }
    
    return SliverList(
      delegate: SliverChildListDelegate(rows),
    );
  }

  Widget _buildLessonCircle(int lessonNumber) {
    // Логика состояний уроков
    Color circleColor;
    String status = '';
    
    if (lessonNumber == 28) {
      circleColor = Colors.green; // Последний (первый снизу) - выполнен
      status = '✓';
    } else if (lessonNumber == 27) {
      circleColor = Colors.orange; // Текущий урок
      status = '→';
    } else if (lessonNumber >= 23) {
      circleColor = Colors.blue; // Доступные уроки
    } else {
      circleColor = Colors.grey.withOpacity(0.6); // Заблокированные
    }
    
    return GestureDetector(
      onTap: () {
        if (lessonNumber >= 23 || lessonNumber == 28) {
          print('Урок $lessonNumber доступен для прохождения');
        }
      },
      child: Column(
        children: [
          // Номер урока над кружком
          Text(
            '$lessonNumber',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          // Сам кружок
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: circleColor.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Text(
                status.isNotEmpty ? status : '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}