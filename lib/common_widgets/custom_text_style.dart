import 'package:flutter/material.dart';
import 'package:uione/constant/custome_color.dart';
import '/constants/text_font_style.dart';

class CustomTextStyle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final LinearGradient? colors;

  const CustomTextStyle({
    super.key,
    required this.text,
    this.style,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) =>
              colors != null
                  ? colors!.createShader(bounds)
                  : GradiantColor.c21489Fc0184FF.createShader(bounds),
      child: Text(text, style: style ?? TextFontStyle.textStyle16Poppins600),
    );
  }
}
