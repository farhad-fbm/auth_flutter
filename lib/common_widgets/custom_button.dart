import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uione/constant/custome_color.dart';
import '/constants/text_font_style.dart';
import '/gen/colors.gen.dart';

Widget customButton({
  double height = 50,
  double width = 200,
  required String title,
  required Function onPressed,
  Color backgroundColor = AppColors.c0184FF,
  TextStyle? textStyle,
}) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      minimumSize: Size(width.w, height.h),
      backgroundColor: backgroundColor,
    ),
    child: Text(
      title,
      style: textStyle ?? TextFontStyle.textStyle16c0184FFPoppins600,
    ),
  );
}

Widget customGradiantButton({
  double height = 40,
  double width = 335,
  required String title,
  required Function onPressed,
  TextStyle? textStyle,
  margin,
}) {
  return InkWell(
    enableFeedback: false,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    onTap: () => onPressed(),
    child: Container(
      margin: margin ?? EdgeInsets.only(bottom: 8.h),
      width: width.h,
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: GradiantColor.c21489Fc0184FF,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle ?? TextFontStyle.textStyle12cFFFFFFPoppins600,
      ),
    ),
  );
}

Widget customIconButton({
  double height = 60,
  double width = 343,
  required String title,
  required Function onPressed,
  String? iconPath,
  Color? backgroundColor,
}) {
  return ElevatedButton(
    onPressed: () => onPressed(),
    style: ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(47, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      side: BorderSide(color: AppColors.cEEEEEE, width: .7.h),
      minimumSize: Size(width.w, height.h),
      backgroundColor: backgroundColor ?? Colors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconPath != null) ...[
          Image.asset(iconPath, height: 24.h, width: 23.04.w),
          SizedBox(width: 8.w),
        ],
        Text(title, style: TextFontStyle.textStyle16c212121Urbanist600),
      ],
    ),
  );
}

class GradientOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final double? width;

  const GradientOutlineButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = 30.sp;
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: GradiantColor.c21489Fc0184FF,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      padding: const EdgeInsets.all(2), // Border width
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Button background
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Text(text, style: TextFontStyle.textStyle12c0184FFPoppins600),
        ),
      ),
    );
  }
}
