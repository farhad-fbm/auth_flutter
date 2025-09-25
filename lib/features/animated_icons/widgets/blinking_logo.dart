import 'package:flutter/material.dart';

class BlinkingLogo extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const BlinkingLogo({super.key, required this.imagePath, this.width = 400, this.height = 200});

  @override
  State<BlinkingLogo> createState() => _BlinkingLogoState();
}

class _BlinkingLogoState extends State<BlinkingLogo> with SingleTickerProviderStateMixin {
  late AnimationController _blinkingController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _blinkingController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _blinkingController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _blinkingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
