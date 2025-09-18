import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CustomRadioButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? Colors.teal : Colors.grey.shade400,
                  width: 2,
                ),
              ),
            ),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
