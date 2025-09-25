import 'package:flutter/material.dart';
import 'icon_mirroring.dart';
import '../data/star_animation_type.dart';
import 'stars_blink_widget.dart';
import 'stars_orbit_widget.dart';
import 'stars_spin_widget.dart';

class AnimatedStarsCard extends StatefulWidget {
  final Color backgroundColor;
  final String centerIconPath;
  final double size;
  final int starCount;
  final double orbitRadius;
  final StarAnimationType animationType;

  const AnimatedStarsCard({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.centerIconPath,
    this.size = 150,
    this.starCount = 5,
    this.orbitRadius = 50,
    this.animationType = StarAnimationType.spin,
  });

  @override
  State<AnimatedStarsCard> createState() => _AnimatedStarsCardState();
}

class _AnimatedStarsCardState extends State<AnimatedStarsCard> with TickerProviderStateMixin {
  late List<Offset> _starPositions;

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
    // _____________________________________________________________________________________________________
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
          IconMirroring(iconPath: widget.centerIconPath, size: widget.size * 0.5),
          ...List.generate(_starPositions.length, (index) {
            switch (widget.animationType) {
              case StarAnimationType.blink:
                return StarsBlinkWidget(position: _starPositions[index], size: 16, index: index);
              case StarAnimationType.spin:
                return StarsSpinWidget(position: _starPositions[index], size: 16, index: index);
              case StarAnimationType.orbit:
                return StarsOrbitWidget(
                  position: _starPositions[index],
                  size: 16,
                  index: index,
                  starCount: widget.starCount,
                  orbitRadius: widget.orbitRadius,
                );
            }
          }),
        ],
      ),
    );
  }
}
