import 'package:flutter/material.dart';

class MirrorIcon extends StatelessWidget {
  final Animation<double> animation;
  final String iconPath;
  final double size;

  const MirrorIcon({
    super.key,
    required this.animation,
    required this.iconPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(animation.value, 1.0),
          child: SizedBox(
            width: size,
            height: size,
            child: Image.asset(iconPath),
          ),
        );
      },
    );
  }
}
