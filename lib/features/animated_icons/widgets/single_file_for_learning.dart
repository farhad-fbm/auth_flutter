import 'dart:math';
import 'package:flutter/material.dart';

enum StarAnimationType { spin, blink, orbit } // NEW enum

class RotatingStarsCard extends StatefulWidget {
  final Color backgroundColor;
  final String centerIconPath;
  final double size;
  final int starCount;
  final double orbitRadius;
  final StarAnimationType animationType; // use this to select spin/blink

  const RotatingStarsCard({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.centerIconPath,
    this.size = 150,
    this.starCount = 5,
    this.orbitRadius = 50,
    this.animationType = StarAnimationType.spin, // default spin
  });

  @override
  State<RotatingStarsCard> createState() => _RotatingStarsCardState();
}

class _RotatingStarsCardState extends State<RotatingStarsCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Offset> _starPositions;

  late AnimationController _mirrorController;
  late Animation<double> _mirrorAnimation;

  late AnimationController _orbitController;
  final Random random = Random();

  @override
  void initState() {
    super.initState();

    // Fixed star positions
    _starPositions = [
      Offset(widget.size * 0.2, widget.size * 0.2),
      Offset(widget.size * 0.8, widget.size * 0.2),
      Offset(widget.size * 0.2, widget.size * 0.8),
      Offset(widget.size * 0.8, widget.size * 0.8),
      Offset(widget.size * 0.5, widget.size * 0.1),
    ];

    _controller = AnimationController(
      vsync: this,
      duration:
          widget.animationType == StarAnimationType.spin
              ? const Duration(seconds: 3)
              : const Duration(seconds: 1),
    )..repeat(reverse: widget.animationType == StarAnimationType.blink);
    _mirrorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    _mirrorAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: -1.0,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 2,
      ),
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 4),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -1.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 2,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 4),
    ]).animate(_mirrorController);

    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _mirrorController.dispose();
    _orbitController.dispose();
    super.dispose();
  }

  Widget _buildStar(Offset pos, double size, int index) {
    if (widget.animationType == StarAnimationType.blink) {
      // Blinking star
      return Positioned(
        left: pos.dx - size / 2,
        top: pos.dy - size / 2,
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(index * 0.1, 1.0, curve: Curves.easeInOut),
            ),
          ),
          child: Icon(Icons.star, color: Colors.yellow, size: size),
        ),
      );
    } else if (widget.animationType == StarAnimationType.spin) {
      // Spinning star
      return Positioned(
        left: pos.dx - size / 2,
        top: pos.dy - size / 2,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(index * 0.1, 1.0, curve: Curves.linear),
            ),
          ),
          child: Icon(Icons.star, color: Colors.yellow, size: size),
        ),
      );
    } else if (widget.animationType == StarAnimationType.orbit) {
      // Orbiting star
      return AnimatedBuilder(
        animation: _orbitController,
        builder: (context, child) {
          final angle =
              2 * pi * _orbitController.value +
              (index * 2 * pi / widget.starCount);
          final dx = widget.orbitRadius * cos(angle);
          final dy = widget.orbitRadius * sin(angle);

          return Transform.translate(
            offset: Offset(dx, dy),
            child: Icon(Icons.star, color: Colors.yellow, size: size),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _mirrorAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()..scale(_mirrorAnimation.value, 1.0),
                child: SizedBox(
                  width: widget.size * 0.5,
                  height: widget.size * 0.5,
                  child: Image.asset(widget.centerIconPath),
                ),
              );
            },
          ),
          // Stars (spin or blink)
          ...List.generate(
            _starPositions.length,
            (index) => _buildStar(_starPositions[index], 16, index),
          ),
        ],
      ),
    );
  }
}
