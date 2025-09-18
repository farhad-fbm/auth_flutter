import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/text_font_style.dart';
import '/gen/assets.gen.dart';
import '../gen/colors.gen.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  bool readOnly;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isObsecure;
  TextInputType textInputType;
  Function(String)? onChanged;
  TextStyle? textStyle;
  String? prefixIcon;
  final String? Function(String?)? validator;
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.isPassword = false,
    this.isObsecure = false,
    this.onChanged,
    this.textStyle,
    this.prefixIcon,
    this.validator,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextFormField(
        readOnly: widget.readOnly,
        onChanged: (v) {
          widget.onChanged?.call(v);
        },
        validator: widget.validator,
        keyboardType: widget.textInputType,
        // style: textStyle,
        controller: widget.controller,
        obscureText: _obscureText,
        // validator: validator,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 20.w, right: 13.w),
            width: 20.w,
            height: 17.h,
            child: Image.asset(
              widget.prefixIcon ??
                  (widget.isPassword
                      ? Assets.icons.password.path
                      : Assets.icons.emailForTextField.path),
              // height: 10.h,
              // width: 20.w,
              fit: BoxFit.contain,
              color: const Color(0x665D5D5D),
            ),
          ),
          isDense: true,

          suffixIcon:
              widget.isObsecure
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Image.asset(
                        height: 24.h,
                        width: 24.w,
                        _obscureText
                            ? Assets.icons.passwordHide.path
                            : Assets.icons.passwordShow.path,
                      ),
                    ),
                  )
                  : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cEAEAEA, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cEAEAEA, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cEAEAEA, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cEAEAEA, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),

          fillColor: AppColors.cFFFFFF,
          filled: true,
          hintStyle: TextFontStyle.textStyle14c444444B2Poppins400,

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
