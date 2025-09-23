import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = const Color.fromARGB(255, 248, 220, 222),
    this.foregroundColor = const Color(0xFFC81500),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.red[800]!, width: 1),
        ),
      ),

      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
