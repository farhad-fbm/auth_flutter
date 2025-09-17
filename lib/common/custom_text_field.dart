import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggle;
  final bool toggleVisible;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.icon,
    this.label,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggle,
    this.toggleVisible = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: icon != null ? Icon(icon) : null,
          suffixIcon:
              isPassword
                  ? IconButton(
                    icon: Icon(
                      toggleVisible ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: onToggle,
                  )
                  : null,
        ),
      ),
    );
  }
}
