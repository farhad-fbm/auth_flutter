import 'dart:math';
import 'package:flutter/material.dart';
import '../data/star_animation_type.dart';

class SmallStarWidget extends StatelessWidget {
  final Offset position;
  final double size;
  final int index;
  final StarAnimationType animationType;
  final AnimationController controller;
  final AnimationController orbitController;
  final int starCount;
  final double orbitRadius;

  const SmallStarWidget({
    super.key,
    required this.position,
    required this.size,
    required this.index,
    required this.animationType,
    required this.controller,
    required this.orbitController,
    required this.starCount,
    required this.orbitRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (animationType == StarAnimationType.blink) {
      return Positioned(
        left: position.dx - size / 2,
        top: position.dy - size / 2,
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(index * 0.1, 1.0, curve: Curves.easeInOut),
            ),
          ),
          child: Icon(Icons.star, color: Colors.yellow, size: size),
        ),
      );
    } else if (animationType == StarAnimationType.spin) {
      return Positioned(
        left: position.dx - size / 2,
        top: position.dy - size / 2,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(index * 0.1, 1.0, curve: Curves.linear),
            ),
          ),
          child: Icon(Icons.star, color: Colors.yellow, size: size),
        ),
      );
    } else if (animationType == StarAnimationType.orbit) {
      return AnimatedBuilder(
        animation: orbitController,
        builder: (context, child) {
          final angle = 2 * pi * orbitController.value + (index * 2 * pi / starCount);
          final dx = orbitRadius * cos(angle);
          final dy = orbitRadius * sin(angle);

          return Transform.translate(
            offset: Offset(dx, dy),
            child: Icon(Icons.star, color: Colors.yellow, size: size),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}
