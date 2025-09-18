import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/text_font_style.dart';
import '/gen/colors.gen.dart';
import '/helpers/ui_helpers.dart';

Widget orline({color, TextStyle? style}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(child: Divider(thickness: 1, color: color ?? AppColors.c0184FF)),
      UIHelper.horizontalSpace(11.w),
      Text("OR", style: style ?? TextFontStyle.textStyle16c0184FFPoppins600),
      UIHelper.horizontalSpace(11.w),

      Expanded(child: Divider(thickness: 1, color: color ?? AppColors.c0184FF)),
    ],
  );
}
