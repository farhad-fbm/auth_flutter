import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CustomField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? labelWithIcon;
  final TextStyle? labelTextStyle;
  final bool isOptional;
  final void Function(String)? onSubmitted;

  const CustomField({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,

    this.maxLines = 1,
    this.labelWithIcon,
    this.labelTextStyle,
    this.isOptional = false,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || labelWithIcon != null)
          labelWithIcon ??
              Text(
                label ?? "",
                style:
                    labelTextStyle ??
                    TextFontStyle.textStyle14c0E1216Poppins400,
              ),
        UIHelper.verticalSpace(10.h),

        TextFormField(
          controller: controller,
          onFieldSubmitted: onSubmitted,
          validator:
              isOptional
                  ? null
                  : (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
          style: TextFontStyle.textStyle12cA3A3A3Poppins400.copyWith(
            color: AppColors.c000000CC,
          ),
          maxLines: maxLines,
          textAlign: prefixIcon != null ? TextAlign.end : TextAlign.start,
          decoration: InputDecoration(
            fillColor: AppColors.cFFFFFF,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: TextFontStyle.textStyle12cA3A3A3Poppins400.copyWith(
              color: AppColors.c000000CC,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.cEAEAEA),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
          ),
        ),
      ],
    );
  }
}
