import 'package:flutter/material.dart';
import 'dart:io';
import 'package:uione/features/image_pickers/presentation/widgets/common_image_view.dart';
import 'package:uione/features/image_pickers/presentation/widgets/custom_button.dart';

class ImagesShowingScreen extends StatelessWidget {
  final List<File> images;
  const ImagesShowingScreen({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFC8170D),
        centerTitle: true,
        title: const Text(
          "FUCEST",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 16, left: 16),

            child: const Text(
              'Foto Des Problem',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder:
                  (context, index) => CommonImageView(image: images[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        title: "Wiederholen",
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        title: "Mehr hinzufügen",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {},
                    title: "Alle hochladen",
                    backgroundColor: Colors.red[800],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
