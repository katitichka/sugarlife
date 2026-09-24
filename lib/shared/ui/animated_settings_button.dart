import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSettingsButton extends StatefulWidget {
  final Future<void> Function() onPressed;

  const AnimatedSettingsButton({super.key, required this.onPressed});

  @override
  State<AnimatedSettingsButton> createState() => _AnimatedSettingsButtonState();
}

class _AnimatedSettingsButtonState extends State<AnimatedSettingsButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handlePressed() async {
    if (_isBusy) return;
    _isBusy = true;
    await _controller.forward();
    try {
      await widget.onPressed();
    } finally {
      if (mounted) {
        await _controller.reverse();
        _isBusy = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 3.14159 / 2,
          child: child,
        );
      },
      child: IconButton(
        iconSize: 40,
        icon: SvgPicture.asset(
          'assets/profile/settings.svg',
          width: 40,
          height: 40,
        ),
        onPressed: _handlePressed,
      ),
    );
  }
}
