import 'package:flutter/material.dart';
import 'package:uione/common_widgets/custom_button.dart';
import 'package:uione/common_widgets/custom_text_field.dart';
import 'package:uione/features/auth/presensation/login_screen.dart';

class RepairShop extends StatefulWidget {
  const RepairShop({super.key});

  @override
  State<RepairShop> createState() => _RepairShopState();
}

class _RepairShopState extends State<RepairShop> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create your Yinmo account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Sign Up as Repair Shop with",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              CustomIconButton(
                icon: Icons.g_mobiledata,
                text: "Google",
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              CustomIconButton(
                icon: Icons.apple,
                text: "Apple",
                onPressed: () {},
              ),
              const SizedBox(height: 16),

              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 16),

              CustomTextField(
                icon: Icons.store,
                label: "Shop Name",
                controller: shopNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your shop name";
                  }
                  return null;
                },
              ),
              CustomTextField(
                icon: Icons.phone,
                label: "Phone",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                    return "Enter a valid phone number";
                  }
                  return null;
                },
              ),
              CustomTextField(
                icon: Icons.location_on,
                label: "Shop Address",
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your shop address";
                  }
                  return null;
                },
              ),

              CustomTextField(
                icon: Icons.email,
                label: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                  if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              // Password Field
              CustomTextField(
                icon: Icons.password,
                label: "Password",
                controller: passwordController,
                isPassword: true,
                obscureText: !passwordVisible,
                onToggle: () {
                  setState(() => passwordVisible = !passwordVisible);
                },
                toggleVisible: passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }

                  // Password must be at least 6 chars, include upper, lower, number, special char
                  final regex = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
                  );

                  if (!regex.hasMatch(value)) {
                    return "Password must have 6+ chars, upper, lower, number & special char";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Confirm Password Field
              CustomTextField(
                icon: Icons.password,
                label: "Confirm Password",
                controller: confirmPasswordController,
                isPassword: true,
                obscureText: !confirmPasswordVisible,
                onToggle: () {
                  setState(
                    () => confirmPasswordVisible = !confirmPasswordVisible,
                  );
                },
                toggleVisible: confirmPasswordVisible,
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

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("Log In"),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // terms & policy
              CheckboxListTile(
                value: agreeToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    agreeToTerms = value ?? false;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, // checkbox on left
                contentPadding: EdgeInsets.zero, // remove default padding
                title: const Text.rich(
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Terms",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: " & "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed:
                    agreeToTerms
                        ? () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Form is valid ")),
                            );
                          }
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
