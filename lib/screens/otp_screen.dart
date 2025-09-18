import 'package:flutter/material.dart';
import 'package:uione/common/custom_back_button.dart';
import 'package:uione/constants/app_colors.dart';

import 'otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.bg4,
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),
                // BackButton(),  // buitin

                SizedBox(height: 16),
                Text(
                  'Entered Your OPT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Padding(padding: EdgeInsets.all(8.0), child: OtpInput()),
        ],
      ),
    );
  }
}
