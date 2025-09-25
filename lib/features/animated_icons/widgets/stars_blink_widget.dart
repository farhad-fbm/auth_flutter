import 'package:flutter/material.dart';

import '../data/star_animation_type.dart';

class StarsBlinkWidget extends StatefulWidget {
  final Offset position;
  final double size;
  final int index;
  final StarAnimationType animationType;

  const StarsBlinkWidget({
    super.key,
    required this.position,
    required this.size,
    required this.index,
    this.animationType = StarAnimationType.blink,
  });

  @override
  State<StarsBlinkWidget> createState() => _SmallSpinWidgetState();
}

class _SmallSpinWidgetState extends State<StarsBlinkWidget> with TickerProviderStateMixin {
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();

    _blinkController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx - widget.size / 2,
      top: widget.position.dy - widget.size / 2,
      child: FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _blinkController,
            curve: Interval(widget.index * 0.1, 1.0, curve: Curves.easeInOut),
          ),
        ),
        child: Icon(Icons.star, color: Colors.yellow, size: widget.size),
      ),
    );
  }
}
