import 'package:flutter/material.dart';
import 'package:uione/common/custom_back_button.dart';
import 'package:uione/constants/app_colors.dart';
import 'package:uione/features/auth/presensation/otp_screen.dart';
import 'package:uione/helpers/email_validation.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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

                SizedBox(height: 16),
                Text(
                  'Forget Password',
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
          const Padding(padding: EdgeInsets.all(8.0), child: EmailInput()),
        ],
      ),
    );
  }
}

//  email field widget
class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  TextEditingController emailController = TextEditingController();
  bool isValidEmail = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      final email = emailController.text.trim();
      final isValid = validateEmail(email);

      if (isValid != isValidEmail) {
        setState(() {
          isValidEmail = isValid;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'enter your email',
            // labelText: 'Enter Your Email',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,

          child: ElevatedButton(
            onPressed:
                isValidEmail
                    ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isValidEmail ? AppColors.bg4 : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Continue",
                style: TextStyle(
                  color: isValidEmail ? AppColors.bg2 : AppColors.bg1,
                ),
              ),
            ),
          ),
          
        ),
      ],
    );
    
  }
}
