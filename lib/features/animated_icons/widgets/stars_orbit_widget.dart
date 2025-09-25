import 'package:flutter/material.dart';
import 'dart:math';
import '../data/star_animation_type.dart';

class StarsOrbitWidget extends StatefulWidget {
  final Offset position;
  final double size;
  final int index;
  final StarAnimationType animationType;
  final int starCount;
  final double orbitRadius;

  const StarsOrbitWidget({
    super.key,
    required this.position,
    required this.size,
    required this.index,
    this.animationType = StarAnimationType.orbit,
    required this.starCount,
    required this.orbitRadius,
  });

  @override
  State<StarsOrbitWidget> createState() => _SmallSpinWidgetState();
}

class _SmallSpinWidgetState extends State<StarsOrbitWidget> with TickerProviderStateMixin {
  late AnimationController _orbitController;

  @override
  void initState() {
    super.initState();

    _orbitController = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
  }

  @override
  void dispose() {
    _orbitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _orbitController,
      builder: (context, child) {
        final angle = 2 * pi * _orbitController.value + (widget.index * 2 * pi / widget.starCount);
        final dx = widget.orbitRadius * cos(angle);
        final dy = widget.orbitRadius * sin(angle);

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Icon(Icons.star, color: Colors.yellow, size: widget.size),
        );
      },
    );
  }
}
