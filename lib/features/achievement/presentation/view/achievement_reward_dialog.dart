import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_cached_svg/flutter_cached_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
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
    final screenSize = MediaQuery.sizeOf(context);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: AppColors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 420,
          maxHeight: screenSize.height - 32,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 52, 24, 24),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Новое достижение!',
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final cardWidth = math.min(
                          _CardFace.maxCardWidth,
                          constraints.maxWidth,
                        );
                        return GestureDetector(
                          onTap: () {
                            if (_isOpened) return;
                            setState(() => _isOpened = true);
                          },
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 700),
                            tween: Tween<double>(
                              begin: 0,
                              end: _isOpened ? 1 : 0,
                            ),
                            builder: (context, value, child) {
                              final angle = value * math.pi;
                              final isFront = value >= 0.5;
                              final face = isFront
                                  ? _CardFace(
                                      width: cardWidth,
                                      imagePath: widget.achievement.imageUrl,
                                      title: widget.achievement.name,
                                      subtitle: widget.achievement.description,
                                    )
                                  : _CardFace(
                                      width: cardWidth,
                                      imagePath:
                                          'assets/achievements/closed_card.svg',
                                      title: 'Нажмите, чтобы открыть',
                                      subtitle: 'Твоя новая награда уже здесь',
                                    );
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(angle),
                                child: isFront
                                    ? Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..rotateY(math.pi),
                                        child: face,
                                      )
                                    : face,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
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
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  static const maxCardWidth = 250.0;

  const _CardFace({
    required this.width,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final double width;
  final String imagePath;
  final String title;
  final String subtitle;

  bool get isNetworkImage => imagePath.startsWith('http');
  bool get isSvg => imagePath.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final scale = width / maxCardWidth;
    final cardHeight = 340 * scale;
    final imageSize = 140 * scale;

    return Container(
      width: width,
      height: cardHeight,
      padding: EdgeInsets.all(12 * scale),
      decoration: BoxDecoration(
        color: AppColors.primaryTint,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.blue),
      ),
      child: Column(
        children: [
          SizedBox.square(
            dimension: imageSize,
            child: Center(child: _buildImage(imageSize)),
          ),
          SizedBox(height: 16 * scale),
          SizedBox(
            height: 60 * scale,
            child: Center(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: math.max(14, 19 * scale),
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 4 * scale),
          Expanded(
            child: Center(
              child: Text(
                subtitle,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: math.max(11, 14 * scale),
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(double imageSize) {
    if (!isNetworkImage) {
      if (imagePath.endsWith('.svg')) {
        return SvgPicture.asset(
          imagePath,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        );
      }
      return Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
      );
    }

    if (isSvg) {
      return FlutterCachedSvg(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        placeholder: SizedBox.square(
          dimension: imageSize,
          child: const LottieProgressIndicator(),
        ),
        errorWidget: SizedBox.square(
          dimension: imageSize,
          child: const Icon(Icons.emoji_events_outlined, color: AppColors.blue),
        ),
      );
    } else {
      return Image.network(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const LottieProgressIndicator();
        },
      );
    }
  }
}
