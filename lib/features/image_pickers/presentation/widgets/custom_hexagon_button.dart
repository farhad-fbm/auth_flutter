import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

//  please add the dependencies :   hexagon: ^0.2.0
class CustomHexagonButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomHexagonButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Border hexagon
        HexagonWidget.pointy(
          width: 52,
          color: Colors.red,
          child: const SizedBox.shrink(),
        ),
        // Inner hexagon
        HexagonWidget.pointy(
          width: 50,
          color: backgroundColor,
          elevation: 4,
          child: Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(icon, size: 30, color: iconColor),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
