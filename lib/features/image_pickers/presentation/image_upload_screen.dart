import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uione/features/image_pickers/presentation/images_showing_screen.dart';
import 'package:uione/features/image_pickers/presentation/widgets/common_image_view.dart';
import 'package:uione/features/image_pickers/presentation/widgets/custom_button.dart';

import 'widgets/custom_hexagon_button.dart';

class PhotoUploadScreen extends StatefulWidget {
  const PhotoUploadScreen({super.key});

  @override
  State<PhotoUploadScreen> createState() => PhotoUploadScreenState();
}

class PhotoUploadScreenState extends State<PhotoUploadScreen> {
  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;
  List<File> images = [];

  Future<void> pickFromGallery() async {
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
        images.add(File(picked.path));
      });
    }
  }

  Future<void> pickFromCamera() async {
    final picked = await imagePicker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
        images.add(File(picked.path));
      });
    }
  }

  void goToImageShowingScreen() {
    if (images.isNotEmpty) {
  
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder:
              (context, animation, secondaryAnimation) =>
                  ImagesShowingScreen(images: images),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fadeAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            return FadeTransition(opacity: fadeAnimation, child: child);
          },
        ),
      );
    }
  }

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
        // crossAxisAlignment: CrossAxisAlignment.start,
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
            child:
                selectedImage != null
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonImageView(image: selectedImage!),
                    )
                    : const Center(child: Text("No Image Selected")),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHexagonButton(
                  onPressed: pickFromGallery,
                  icon: Icons.photo,
                  iconColor: Colors.red[800]!,
                  backgroundColor: const Color.fromARGB(255, 248, 220, 222),
                ),

                CustomHexagonButton(
                  icon: Icons.camera_alt,
                  iconColor: Colors.white,
                  backgroundColor: Colors.red[800]!,
                  onPressed: pickFromCamera,
                ),
                CustomButton(
                  title: 'Weiter',
                  onPressed: goToImageShowingScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
