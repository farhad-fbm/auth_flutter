
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final BorderSide? border;
  final double borderRadius;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.border,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 28),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: border,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
