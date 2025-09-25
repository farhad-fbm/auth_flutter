import 'package:flutter/material.dart';

class IconMirroring extends StatefulWidget {
  // final Animation<double> animation;
  final String iconPath;
  final double size;

  const IconMirroring({
    super.key,
    // required this.animation,
    required this.iconPath,
    required this.size,
  });

  @override
  State<IconMirroring> createState() => _IconMirroringState();
}

class _IconMirroringState extends State<IconMirroring> with TickerProviderStateMixin {
  late AnimationController _mirrorController;
  late Animation<double> _mirrorAnimation;

  @override
  void initState() {
    super.initState();

    _mirrorController = AnimationController(vsync: this, duration: const Duration(seconds: 12))
      ..repeat();

    _mirrorAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: -1.0).chain(CurveTween(curve: Curves.linear)),
        weight: 2,
      ),
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 4),
      TweenSequenceItem(
        tween: Tween(begin: -1.0, end: 1.0).chain(CurveTween(curve: Curves.linear)),
        weight: 2,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 4),
    ]).animate(_mirrorController);
  }

  @override
  void dispose() {
    _mirrorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _mirrorAnimation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          // transform: Matrix4.identity()..scale(widget.animation.value, 1.0),
          transform: Matrix4.identity()..scale(_mirrorAnimation.value, 1.0),
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Image.asset(widget.iconPath),
          ),
        );
      },
    );
  }
}
