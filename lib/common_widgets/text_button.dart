import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/constants/text_font_style.dart';

Widget textButton({
  String? additionalText,
  required String buttonTitle,
  required Function onPressed,
  TextStyle? buttonTextStyle,
  TextStyle? additionalTextStyle,
}) {
  buttonTextStyle ??= TextFontStyle.textStyle16c071431Poppins500;
  additionalTextStyle ??= TextFontStyle.textStyle14c4D4D4DPoppins400;
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: additionalText, style: additionalTextStyle),
        TextSpan(
          text: buttonTitle,
          style: buttonTextStyle,
          recognizer:
              TapGestureRecognizer()
                ..onTap = () {
                  onPressed();
                },
        ),
      ],
    ),
  );
}
