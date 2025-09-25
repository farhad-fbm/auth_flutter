import 'package:flutter/material.dart';

import '../data/star_animation_type.dart';

class StarsSpinWidget extends StatefulWidget {
  final Offset position;
  final double size;
  final int index;
  final StarAnimationType animationType;

  const StarsSpinWidget({
    super.key,
    required this.position,
    required this.size,
    required this.index,
    this.animationType = StarAnimationType.blink,
  });

  @override
  State<StarsSpinWidget> createState() => _SmallSpinWidgetState();
}

class _SmallSpinWidgetState extends State<StarsSpinWidget> with TickerProviderStateMixin {
  late AnimationController _spinController;

  @override
  void initState() {
    super.initState();

    _spinController = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx - widget.size / 2,
      top: widget.position.dy - widget.size / 2,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _spinController,
            curve: Interval(widget.index * 0, 1, curve: Curves.linear),
          ),
        ),
        child: Icon(Icons.star, color: Colors.yellow, size: widget.size),
      ),
    );
  }
}
