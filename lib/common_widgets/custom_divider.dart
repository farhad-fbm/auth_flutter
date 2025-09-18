import 'package:flutter/material.dart';
import '/gen/colors.gen.dart';

Widget customDivider(Widget child) {
  return Row(
    children: [
      const Expanded(child: Divider(color: AppColors.cEEEEEE, thickness: 1.4)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: child,
      ),
      const Expanded(child: Divider(color: AppColors.cEEEEEE, thickness: 1.4)),
    ],
  );
}
