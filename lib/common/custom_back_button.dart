import 'package:flutter/material.dart';
import 'package:uione/constant/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white, // background color of button
        borderRadius: BorderRadius.circular(100), 
        border: Border.all(color: AppColors.bg2, width: 1),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
