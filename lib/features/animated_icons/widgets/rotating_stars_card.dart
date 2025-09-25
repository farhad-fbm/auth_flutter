import 'package:flutter/material.dart';

import 'icon_mirroring.dart';
import 'small_star_widget.dart';
import '../data/star_animation_type.dart';

class RotatingStarsCard extends StatefulWidget {
  final Color backgroundColor;
  final String centerIconPath;
  final double size;
  final int starCount;
  final double orbitRadius;
  final StarAnimationType animationType;

  const RotatingStarsCard({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.centerIconPath,
    this.size = 150,
    this.starCount = 5,
    this.orbitRadius = 50,
    this.animationType = StarAnimationType.spin,
  });

  @override
  State<RotatingStarsCard> createState() => _RotatingStarsCardState();
}

class _RotatingStarsCardState extends State<RotatingStarsCard> with TickerProviderStateMixin {
  late List<Offset> _starPositions;
  late AnimationController _spinController;
  late AnimationController _orbitController;
  // late Animation<double> _mirrorAnimation;

  @override
  void initState() {
    super.initState();

    _starPositions = [
      Offset(widget.size * 0.2, widget.size * 0.2),
      Offset(widget.size * 0.8, widget.size * 0.2),
      Offset(widget.size * 0.2, widget.size * 0.8),
      Offset(widget.size * 0.8, widget.size * 0.8),
      Offset(widget.size * 0.5, widget.size * 0.1),
    ];

    _spinController = AnimationController(
      vsync: this,
      duration: widget.animationType == StarAnimationType.spin
          ? const Duration(seconds: 3)
          : const Duration(seconds: 1),
    )..repeat(reverse: widget.animationType == StarAnimationType.blink);

    // _________________________________________________________________________________________________
    _orbitController = AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat();
  }

  @override
  void dispose() {
    _spinController.dispose();
    _orbitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2))],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconMirroring(
            // animation: _mirrorAnimation,
            iconPath: widget.centerIconPath,
            size: widget.size * 0.5,
          ),
          ...List.generate(
            _starPositions.length,
            (index) => SmallStarWidget(
              position: _starPositions[index],
              size: 16,
              index: index,
              animationType: widget.animationType,
              controller: _spinController,
              orbitController: _orbitController,
              starCount: widget.starCount,
              orbitRadius: widget.orbitRadius,
            ),
          ),
        ],
      ),
    );
  }
}
