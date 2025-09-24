import 'package:flutter/material.dart';

class BlinkingImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const BlinkingImage({
    super.key,
    required this.imagePath,
    this.width = 400,
    this.height = 200,
  });

  @override
  State<BlinkingImage> createState() => _BlinkingImageState();
}

class _BlinkingImageState extends State<BlinkingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // will fade in and out

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
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
