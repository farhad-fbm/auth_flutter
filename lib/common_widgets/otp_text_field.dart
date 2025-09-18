import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/text_font_style.dart';
import '/gen/colors.gen.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onSubmitted;
  final double fieldSize;
  final double spacing;
  final InputDecoration decoration;
  final TextStyle? textStyle;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomOtpField({
    super.key,
    required this.length,
    this.onCompleted,
    this.onSubmitted,
    this.fieldSize = 71,
    this.spacing = 12,
    this.decoration = const InputDecoration(
      border: OutlineInputBorder(),
      counterText: '',
    ),
    this.textStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  String otp = '';

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void didUpdateWidget(CustomOtpField oldWidget) {
    if (oldWidget.length != widget.length) {
      _disposeFields();
      _initializeFields();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _disposeFields() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  @override
  void dispose() {
    _disposeFields();
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < widget.length - 1) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
      _updateOtp();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  void _updateOtp() {
    String otp = '';
    for (var controller in _controllers) {
      otp += controller.text;
    }
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
      widget.onSubmitted?.call(otp);
    }
    setState(() => otp = otp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.length, (index) {
        return Container(
          width: widget.fieldSize.w,
          height: widget.fieldSize.h,
          margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,

            style:
                widget.textStyle ?? TextFontStyle.textStyle24c0E1216Poppins400,
            decoration: widget.decoration.copyWith(
              fillColor: AppColors.cFFFFFF,
              filled: true,
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.c0184FF, width: 0.8.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.cEAEAEA, width: 0.8.w),
              ),
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 18.h),
            ),
            onFieldSubmitted: (value) {
              widget.onSubmitted?.call(value);
            },
            onChanged: (value) => _onChanged(index, value),
          ),
        );
      }),
    );
  }
}
