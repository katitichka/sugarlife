import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<Offset> positions;
  final ScrollController _scrollController = ScrollController();

  static const double stepY = 100;
  static const double stepX = 80;
  static const double circleSize = 60;
  static const double bottomOffset = 100;
  static const double topPadding = 100;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double startY = screenHeight - 100;
    double centerX = MediaQuery.of(context).size.width / 2;
    positions = List.generate(21, (index) => _calculatePosition(index, startY, centerX));

    double minY = positions.map((p) => p.dy).reduce((a, b) => a < b ? a : b);
    double maxY = positions.map((p) => p.dy).reduce((a, b) => a > b ? a : b);
    double contentHeight = maxY - minY + 300;
    
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: contentHeight,
          child: Stack(
            children: positions.asMap().entries.map((entry) {
              int index = entry.key;
  Offset pos = entry.value;
              return Positioned(
                left: pos.dx,
                top: pos.dy - minY + 100,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.navActive,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: AppColors.mainTextColor),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      );
    
    
  }
}

Offset _calculatePosition(int index, double startY, double centerX) {
  double stepX = 80;
  double stepY = 100;

  double x;
  int remainder = index % 4;

  if (remainder == 0) {
    x = centerX - stepX;
  } else if (remainder == 1) {
    x = centerX;
  } else if (remainder == 2) {
    x = centerX + stepX;
  } else {
    x = centerX;
  }

  double y = startY - index * stepY;
  return Offset(x, y);
}

// import 'package:flutter/material.dart';
// import 'package:sugarlife/core/theme/app_color.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({super.key});

//   @override
//   State<GamePage> createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   final int totalLessons = 28;
  
//   final ScrollController _scrollController = ScrollController();
  
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }
  
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: CustomScrollView(
//           controller: _scrollController,
//           reverse: true, 
//           slivers: [
//             SliverToBoxAdapter(
//               child: SizedBox(height: 100), 
//             ),
            
//             _buildLessonsMap(),
            
//             SliverToBoxAdapter(
//               child: SizedBox(height: 80), 
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLessonsMap() {
//     List<Widget> rows = [];
    
//     for (int rowIndex = 6; rowIndex >= 0; rowIndex--) {
//       final bool isEvenRow = rowIndex % 2 == 0; 
//       final startIndex = rowIndex * 4;
      
//       List<Widget> circles = [];
//       for (int i = 0; i < 4; i++) {
//         int lessonNumber = startIndex + i + 1;

//         if (isEvenRow) {
//           lessonNumber = startIndex + (4 - i);
//         } else {
//           lessonNumber = startIndex + i + 1;
//         }
        
//         circles.add(_buildLessonCircle(lessonNumber));
//       }
      
//       rows.add(
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: circles,
//           ),
//         ),
//       );
      
//       if (rowIndex > 0) {
//         rows.add(
//           Container(
//             height: 2,
//             margin: EdgeInsets.symmetric(horizontal: 60),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.transparent,
//                   Colors.white.withOpacity(0.7),
//                   Colors.transparent,
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     }
    
//     return SliverList(
//       delegate: SliverChildListDelegate(rows),
//     );
//   }

//   Widget _buildLessonCircle(int lessonNumber) {
//     // Логика состояний уроков
//     Color circleColor;
//     String status = '';
    
//     if (lessonNumber == 28) {
//       circleColor = Colors.green; // Последний (первый снизу) - выполнен
//       status = '✓';
//     } else if (lessonNumber == 27) {
//       circleColor = Colors.orange; // Текущий урок
//       status = '→';
//     } else if (lessonNumber >= 23) {
//       circleColor = Colors.blue; // Доступные уроки
//     } else {
//       circleColor = Colors.grey.withOpacity(0.6); // Заблокированные
//     }
    
//     return GestureDetector(
//       onTap: () {
//         if (lessonNumber >= 23 || lessonNumber == 28) {
//           print('Урок $lessonNumber доступен для прохождения');
//         }
//       },
//       child: Column(
//         children: [
//           // Номер урока над кружком
//           Text(
//             '$lessonNumber',
//             style: TextStyle(
//               color: Colors.white70,
//               fontSize: 12,
//             ),
//           ),
//           SizedBox(height: 4),
//           // Сам кружок
//           Container(
//             width: 65,
//             height: 65,
//             decoration: BoxDecoration(
//               color: circleColor,
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.white.withOpacity(0.3),
//                 width: 2,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: circleColor.withOpacity(0.5),
//                   blurRadius: 8,
//                   spreadRadius: 1,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: Text(
//                 status.isNotEmpty ? status : '',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }