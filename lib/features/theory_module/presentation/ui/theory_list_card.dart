import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';

class TheoryListCard extends StatelessWidget {
  final TheoryModuleEntity module;
  final int moduleId;

  const TheoryListCard({
    super.key,
    required this.module,
    required this.moduleId,
  });

  Color mixWithBlack(Color color, [double amount = 0.2]) {
    return Color.lerp(color, Colors.black, amount)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: mixWithBlack(module.color, 0.1),
              offset: Offset(3, 3), // справа и снизу
              blurRadius: 0, // без размытия
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide.none,
          ),
          color: module.color,
          child: InkWell(
            onTap: () => context.push('/theory/module/${module.id}'),
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    right: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          module.title,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          module.subtitle,
                          maxLines: 3,
                          softWrap: true,
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 130,
                      height: 70,

                      child: SvgPicture.asset(
                        'assets/modules/theory_characters/character_module$moduleId.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
