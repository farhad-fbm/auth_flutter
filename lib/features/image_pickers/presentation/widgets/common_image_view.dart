import 'dart:io';
import 'package:flutter/material.dart';

class CommonImageView extends StatelessWidget {
  final File image;
  const CommonImageView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: Colors.red, width: 2),
        ),

        child: SizedBox(
          height: 550,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(image, fit: BoxFit.fill, width: double.infinity),
          ),
        ),
      ),
    );
  }
}
