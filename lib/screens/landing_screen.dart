import 'package:flutter/material.dart';
import 'package:uione/screens/car_owner.dart';
import 'package:uione/screens/repair_shop.dart';

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
            Text(
              "Lets get you setup",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Tell us who you are to peresonalize your expertize'),

            SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: selectableButton("Car Owner")),
                const SizedBox(width: 12),
                Expanded(child: selectableButton("Repair Shop")),
              ],
            ),

            SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // full width
              child: selectableButton('test'),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selected == "Car Owner") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CarOwner()),
                    );
                  } else if (selected == "Repair Shop") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RepairShop(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select an option")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white, // text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: const Text('Continue'),
              ),
            ),

            SizedBox(height: 16),
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
