import '/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class BottomNavBarItem {
  String title;
  String image;
  bool isActive;
  BottomNavBarItem({
    required this.title,
    required this.image,
    required this.isActive,
  });

  Widget buildWidget() {
    return Container(
      width: 93.w,
      height: isActive ? 100.h : 60.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 20.w,
            height: 24.h,
            color: isActive ? AppColors.c0184FF : AppColors.c696969,
          ),
          UIHelper.verticalSpace(4.h),
          if (isActive)
            Text(title, style: TextFontStyle.textStyle12c0184FFPoppins500),
          if (isActive) UIHelper.verticalSpace(4.h),
        ],
      ),
    );
  }
}
