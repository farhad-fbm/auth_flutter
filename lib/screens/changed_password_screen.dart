import 'package:flutter/material.dart';
import 'package:uione/common/custom_back_button.dart';
import 'package:uione/common/custom_text_field.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasUpperLower = false;
  bool passwordsMatch = false;

  void validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 6;
      hasNumber = RegExp(r'[0-9]').hasMatch(password);
      hasUpperLower =
          RegExp(r'[A-Z]').hasMatch(password) &&
          RegExp(r'[a-z]').hasMatch(password);

      // update match check too
      passwordsMatch = password == confirmPasswordController.text;
    });
  }

  void validateConfirmPassword(String confirmPassword) {
    setState(() {
      passwordsMatch = confirmPassword == passwordController.text;
    });
  }

  bool get isPasswordValid => hasMinLength && hasNumber && hasUpperLower;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Password field
        CustomTextField(
          controller: passwordController,
          isPassword: true,
          obscureText: !passwordVisible,
          onToggle: () {
            setState(() => passwordVisible = !passwordVisible);
          },
          toggleVisible: passwordVisible,
          onChanged: validatePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }
            return null;
          },
        ),

        // Confirm password field (disabled until valid password)
        IgnorePointer(
          ignoring: !isPasswordValid,
          child: Opacity(
            opacity: isPasswordValid ? 1 : 0.5,
            child: CustomTextField(
              controller: confirmPasswordController,
              isPassword: true,
              obscureText: !confirmPasswordVisible,
              onToggle: () {
                setState(
                  () => confirmPasswordVisible = !confirmPasswordVisible,
                );
              },
              toggleVisible: confirmPasswordVisible,
              onChanged: validateConfirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                }
                if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Conditions
        buildConditionRow("At least 6 characters", hasMinLength),
        buildConditionRow("At least one number", hasNumber),
        buildConditionRow("Uppercase & lowercase letters", hasUpperLower),
        buildConditionRow("Passwords match", passwordsMatch),

        ElevatedButton(
          onPressed:
              passwordsMatch
                  ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password reset successful!"),
                      ),
                    );
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: passwordsMatch ? AppColors.bg4 : AppColors.bg3,
            foregroundColor: passwordsMatch ? AppColors.bg2 : AppColors.bg1,
          ),
          child: const Text('Reset Password'),
        ),
      ],
    );
  }

  Widget buildConditionRow(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isValid ? AppColors.bg4 : AppColors.bg3,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: AppColors.bg2, fontSize: 14)),
      ],
    );
  }
}
