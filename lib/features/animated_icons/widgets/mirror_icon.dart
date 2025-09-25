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
        return Transform.scale(
          alignment: Alignment.center,
          scale: animation.value,
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
