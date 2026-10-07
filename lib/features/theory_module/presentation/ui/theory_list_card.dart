import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
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
    return Color.lerp(color, AppColors.black, amount)!;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 360;
            final horizontalPadding = compact ? 12.0 : 32.0;
            final characterWidth = compact ? 92.0 : 130.0;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 4,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: mixWithBlack(module.color, 0.1),
                      offset: const Offset(3, 3),
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
                      height: compact ? 108 : 100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            right: characterWidth,
                            top: 10,
                            bottom: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  module.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.rubik(
                                    fontSize: compact ? 15 : 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    module.subtitle,
                                    maxLines: compact ? 4 : 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SizedBox(
                              width: characterWidth,
                              height: compact ? 62 : 70,
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
          },
        ),
      ),
    );
  }
}
