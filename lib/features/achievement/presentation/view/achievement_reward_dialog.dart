import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class AchievementRewardDialog extends StatefulWidget {
  const AchievementRewardDialog({required this.achievement, super.key});

  final AchievementEntity achievement;

  @override
  State<AchievementRewardDialog> createState() =>
      _AchievementRewardDialogState();
}

class _AchievementRewardDialogState extends State<AchievementRewardDialog> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30,),
                Text(
                  'Новое достижение!',
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    if (_isOpened) {
                      return;
                    }
                    setState(() {
                      _isOpened = true;
                    });
                  },
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween<double>(begin: 0, end: _isOpened ? 1 : 0),
                    builder: (context, value, child) {
                      final angle = value * math.pi;
                      final isFront = value >= 0.5;
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                        child: isFront
                            ? Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(math.pi),
                                child: _CardFace(
                                  imagePath: widget.achievement.imageUrl,
                                  title: widget.achievement.name,
                                  subtitle: widget.achievement.description,
                                ),
                              )
                            : const _CardFace(
                                imagePath:
                                    'assets/achievements/closed_card.svg',
                                title: 'Нажми, чтобы открыть',
                                subtitle: 'Твоя новая награда уже здесь',
                              ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColors.blue,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  const _CardFace({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  bool get isNetworkImage => imagePath.startsWith('http');
  bool get isSvg => imagePath.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(64, 153, 219, 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color.fromRGBO(64, 153, 219, 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blue,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (!isNetworkImage) {
      if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: 140,
        fit: BoxFit.contain,
      );
    }
    return Image.asset(
      imagePath,
      width: 140,
      fit: BoxFit.contain,
    );
  
    }

    if (isSvg) {
      return SvgPicture.network(
        imagePath,
        width: 140,
        placeholderBuilder: (context) => const SizedBox(
          width: 140,
          child: LottieProgressIndicator(),
        ),
      );
    } else {
      return Image.network(
        imagePath,
        width: 140,
        fit: BoxFit.contain,
      );
    }
  }
}
