import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:uione/screens/car_owner_screen.dart';
// import 'package:uione/screens/repair_shop_screen.dart';

// import '../features/animated_icons/icon_home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _SelectPageState();
}

class _SelectPageState extends State<LandingScreen> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Lets get you setup", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Tell us who you are to peresonalize your expertize'),

            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: selectableButton("Car Owner")),
                const SizedBox(width: 12),
                Expanded(child: selectableButton("Repair Shop")),
              ],
            ),

            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: selectableButton('Shop')),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: selectableButton("Image Upload")),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: selectableButton('Animation Screen')),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selected == "Car Owner") {
                    context.push('/car_owner');
                  } else if (selected == "Repair Shop") {
                    context.push('/repair_shop');
                  } else if (selected == "Shop") {
                    context.push('/shop_home');
                  } else if (selected == "Image Upload") {
                    context.push('/img_upload');
                  } else if (selected == "Animation Screen") {
                    context.push('/coin_rise_page');
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Please select an option")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: const Text('Continue'),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // reusable button
  Widget selectableButton(String value) {
    final bool isActive = selected == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[400],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          value.toUpperCase(),
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
