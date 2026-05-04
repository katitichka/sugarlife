import 'package:flutter/material.dart';
import 'package:sugarlife/core/theme/app_color.dart';

/// Three horizontally aligned dots with a staggered fade animation.
class AnimatedLoadingDots extends StatefulWidget {
  const AnimatedLoadingDots({
    super.key,
    this.size = 12,
    this.spacing = 10,
    this.color,
  });

  final double size;
  final double spacing;
  final Color? color;

  @override
  State<AnimatedLoadingDots> createState() => _AnimatedLoadingDotsState();
}

class _AnimatedLoadingDotsState extends State<AnimatedLoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.white;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = (_controller.value + i * 0.22) % 1.0;
            final opacity = 0.35 + 0.65 * ((t < 0.5 ? t * 2 : 2 - t * 2));
            return Padding(
              padding: EdgeInsets.only(
                right: i < 2 ? widget.spacing : 0,
              ),
              child: Opacity(
                opacity: opacity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: widget.size,
                    height: widget.size,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
