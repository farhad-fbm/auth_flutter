import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/helpers/navigation_service.dart';

import 'custom_button.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

Widget customBottomBtn({
  required VoidCallback onTap,
  leftBtnText = "Back",
  rightBtnText = "Next",
  leftBtnOnTap,
  height,
  width,
  widthOutlineButton,
  rightBtnOnTap,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GradientOutlineButton(
        onPressed:
            leftBtnOnTap ??
            () {
              NavigationService.goBack;
            },
        text: leftBtnText ?? "Back",
        width: widthOutlineButton ?? 89.w,
        height: 38.h,
      ),
      UIHelper.horizontalSpace(10.w),
      customGradiantButton(
        textStyle: TextFontStyle.textStyle12cFFFFFFPoppins600,
        title: rightBtnText ?? 'Next',
        onPressed: () => onTap(),
        margin: EdgeInsets.only(bottom: 0.h),
        width: width ?? 110.w,
        height: 44.h,
      ),
    ],
  );
}
