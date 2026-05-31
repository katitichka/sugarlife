import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarlife/core/theme/app_color.dart';

class AnimatedSettingsButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AnimatedSettingsButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<AnimatedSettingsButton> createState() => _AnimatedSettingsButtonState();
}

class _AnimatedSettingsButtonState extends State<AnimatedSettingsButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isOpen = false;

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

  void _handlePressed() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onPressed();
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