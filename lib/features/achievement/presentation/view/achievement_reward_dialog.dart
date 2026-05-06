import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sugarlife/core/assets/app_assets.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';

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
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Новое достижение!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 20),
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
                                  imagePath: AppAssets.achievementOpenCup,
                                  title: widget.achievement.name,
                                  subtitle: widget.achievement.description,
                                ),
                              )
                            : const _CardFace(
                                imagePath: AppAssets.achievementClosedCard,
                                title: 'Нажми, чтобы открыть',
                                subtitle: 'Твоя новая награда уже здесь',
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
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
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FBFF),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.blue.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (!isNetworkImage) {
      // Локальный PNG
      return Image.asset(imagePath, width: 140, height: 140, fit: BoxFit.contain);
    }
    
    // Сетевой URL
    if (isSvg) {
      return SvgPicture.network(
        imagePath,
        width: 140,
        height: 140,
        placeholderBuilder: (context) => const SizedBox(
          width: 140,
          height: 140,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Image.network(
        imagePath,
        width: 140,
        height: 140,
        fit: BoxFit.contain,
      );
    }
  }
}
