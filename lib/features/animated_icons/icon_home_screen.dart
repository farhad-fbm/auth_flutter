import 'package:flutter/material.dart';
import 'dart:math';

import 'widgets/blinking_image.dart';
import 'widgets/rotating_stars_card.dart';
import 'widgets/star_animation_type.dart';

class CoinRisePage extends StatefulWidget {
  const CoinRisePage({super.key});

  @override
  CoinRisePageState createState() => CoinRisePageState();
}

class CoinRisePageState extends State<CoinRisePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int coinCount = 20;
  final Random random = Random();

  late final List<double> coinSizes;
  late final List<double> coinDelays;
  late final List<double> coinXOffsets;
  late final List<double> coinRotations;

  @override
  void initState() {
    super.initState();

    // Precompute coin properties
    coinSizes = List.generate(coinCount, (_) => random.nextDouble() * 15 + 15);
    coinDelays = List.generate(coinCount, (_) => random.nextDouble() * 0.3);
    coinXOffsets = List.generate(coinCount, (_) => (random.nextDouble() - 0.5) * 80);
    coinRotations = List.generate(coinCount, (_) => (random.nextDouble() - 0.5) * pi / 4);

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    // Reset after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _controller.reset();
    });
  }

  bool clicked = false;
  void _riseCoins() {
    setState(() {
      clicked = true;
    });
    _controller.forward(from: 0);
  }

  Widget _buildCoins(double screenHeight) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        List<Widget> coins = [];
        for (int i = 0; i < coinCount; i++) {
          double progress = (_controller.value - coinDelays[i]).clamp(0.0, 1.0);
          if (progress <= 0) continue; // hide before delay

          double easedProgress = Curves.easeOut.transform(progress);
          double yPos = screenHeight * easedProgress;
          double opacity = (1 - easedProgress).clamp(0.0, 1.0);
          double rotation = coinRotations[i] * easedProgress;
          double scale = 0.8 + 0.4 * easedProgress;

          coins.add(
            Positioned(
              bottom: yPos,
              left: MediaQuery.of(context).size.width / 2 - 15 + coinXOffsets[i],
              child: Opacity(
                opacity: opacity,
                child: Transform.rotate(
                  angle: rotation,
                  child: Transform.scale(
                    scale: scale,
                    child: Icon(Icons.circle, color: Colors.amber, size: coinSizes[i]),
                  ),
                ),
              ),
            ),
          );
        }
        return Stack(children: coins);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Color(0xFF012312),
      backgroundColor: Colors.orangeAccent[100],
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                BlinkingImage(imagePath: "assets/icons/neon_logo.png", width: 400, height: 200),

                // Spinning stars
                RotatingStarsCard(
                  centerIconPath: "assets/icons/3d_star.png",
                  backgroundColor: Colors.blue,
                  animationType: StarAnimationType.spin,
                ),
                SizedBox(height: 16),
                // Blinking stars
                RotatingStarsCard(
                  centerIconPath: "assets/icons/3d_gift_box.png",
                  backgroundColor: Colors.purple,
                  animationType: StarAnimationType.blink,
                ),
                SizedBox(height: 16),
                RotatingStarsCard(
                  centerIconPath: "assets/icons/3d_star.png",
                  backgroundColor: Colors.blue,
                  animationType: StarAnimationType.orbit,
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
          _buildCoins(screenHeight),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: SizedBox(height: 60),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _riseCoins,
        child: SizedBox(
          width: 60,
          height: 60,
          child: clicked
              ? Image.asset("assets/icons/3di_bag.png")
              : Image.asset("assets/icons/3d_gift_box.png"),
        ),
      ),
    );
  }
}
