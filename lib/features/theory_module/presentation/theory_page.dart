import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class TheoryPage extends StatefulWidget {
  const TheoryPage({super.key});

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  final List<Map<String, String>> modules = [
    {
      'id': '1',
      'title': 'сахарный диабет это 1...',
    },
    {
      'id': '2',
      'title': 'сахарный диабет это 2...',
    },
    {
      'id': '3',
      'title': 'сахарный диабет это 3...',
    },
    {
      'id': '4',
      'title': 'сахарный диабет это 4...',
    },
  ];

  Widget _buildModuleCard(String moduleNumber, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Модуль $moduleNumber',
              style: GoogleFonts.comfortaa(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () {
          print('Модуль $moduleNumber нажат');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Теоретический модуль',
          style: GoogleFonts.comfortaa(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.mainTextColor,
          ),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final module = modules[index];
            return _buildModuleCard(module['id']!, module['title']!);
          }),
    );
  }
}
