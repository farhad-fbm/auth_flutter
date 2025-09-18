import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget descriptionField({
  required TextEditingController controller,
  required String hintText,
  required ValueChanged onChanged,
  TextStyle? textStyle,
  TextStyle? hintStyle,
}) {
 

  return TextFormField(
    controller: controller,
    maxLines: null,
    minLines: 3,
    keyboardType: TextInputType.multiline,
    style: textStyle,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      border: OutlineInputBorder(
        // borderSide: const BorderSide(color: AppColors.c8BAAAD),
        borderRadius: BorderRadius.circular(20.r),
      ),
      focusedBorder: OutlineInputBorder(
        // borderSide: const BorderSide(color: AppColors.c8BAAAD, width: 2),
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
    onChanged: (value) {
      onChanged.call(value);
    },
  );
}
