//  email field widget
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'changed_password_screen.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  bool isValidOTP = false;
  String get otp => controllers.map((c) => c.text).join();
  static const String fixedOTP = '1234';

  void onChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    setState(() {
      isValidOTP = otp == fixedOTP; //bool result = (a == b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 60,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,

                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '—',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => onChanged(value, index),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangedPasswordScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isValidOTP ? AppColors.bg4 : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Continue"),
            ),
          ),
        ),
      ],
    );
  }
}
