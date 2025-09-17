import 'package:flutter/material.dart';
import 'package:uione/common/custom_back_button.dart';
import 'package:uione/constant/app_colors.dart';

class ChangedPasswordScreen extends StatelessWidget {
  const ChangedPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.bg4,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),

                SizedBox(height: 16),
                Text(
                  'Change Your Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(padding: const EdgeInsets.all(8.0), child: PasswordInput()),
        ],
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
