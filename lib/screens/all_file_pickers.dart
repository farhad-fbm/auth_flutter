import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  PickerScreenState createState() => PickerScreenState();
}

class PickerScreenState extends State<PickerScreen> {
  File? image;
  File? video;
  DateTime? dateTime;
  String? filePath;

  final ImagePicker picker = ImagePicker();

  // Pick Image
  Future<void> pickImage() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  // Pick Video
  Future<void> pickVideo() async {
    final XFile? pickedVideo = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      setState(() {
        video = File(pickedVideo.path);
      });
    }
  }

  // Pick Date & Time
  Future<void> pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          dateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  // Pick any file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Universal Picker')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPickerButton(title: 'Pick Image', onPressed: pickImage),
              image != null
                  ? CircleAvatar(radius: 50, backgroundImage: FileImage(image!))
                  : SizedBox.shrink(),
              SizedBox(height: 20),

              buildPickerButton(title: 'Pick Video', onPressed: pickVideo),
              video != null
                  ? Text('Video selected: ${video!.path.split('/').last}')
                  : SizedBox.shrink(),
              SizedBox(height: 20),
              buildPickerButton(
                title: 'Pick Date & Time',
                onPressed: pickDateTime,
              ),
              dateTime != null
                  ? Text('Selected: $dateTime')
                  : SizedBox.shrink(),
              SizedBox(height: 20),

              buildPickerButton(title: 'Pick Any File', onPressed: pickFile),
              filePath != null
                  ? Text('File selected: ${filePath!.split('/').last}')
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPickerButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // roundness
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // size
        // backgroundColor: Colors.blue, // button color
      ),
      child: Text(title),
    );
  }
}
