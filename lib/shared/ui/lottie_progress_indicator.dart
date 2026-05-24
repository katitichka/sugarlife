import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieProgressIndicator extends StatelessWidget {
  final double size;
  final String animationPath;

  const LottieProgressIndicator({
    super.key,
    this.size = 50,
    this.animationPath = 'assets/animations/loading.json',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        animationPath,
        repeat: true,
        fit: BoxFit.contain,
      ),
    );
  }
}