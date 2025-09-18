// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
import '/helpers/di.dart';
import '../constants/app_constants.dart';

import '../gen/colors.gen.dart';

//final appData = locator.get<GetStorage>();
// final plcaeMarkAddress = locator.get<PlcaeMarkAddress>();
//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

// Future<String?> networkImageToBase64(String imageUrl) async {
//   http.Response response = await http.get(Uri.parse(imageUrl));
//   final bytes = response.bodyBytes;

//   // ignore: unnecessary_null_comparison
//   return (bytes != null ? base64Encode(bytes) : null);
// }

Future<void> setInitValue() async {
  appData.writeIfNull(kKeyfirstTime, true);
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(kKeyIsExploring, false);

  // appData.writeIfNull(kKeySelectedLat, 38.74631383626653);
  // appData.writeIfNull(kKeySelectedLng, -9.130169921874991);
  //codemen

  // var deviceInfo = DeviceInfoPlugin();
  // if (Platform.isIOS) {
  //   var iosDeviceInfo = await deviceInfo.iosInfo;
  //   appData.writeIfNull(
  //       kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  // } else if (Platform.isAndroid) {
  //   var androidDeviceInfo =
  //       await deviceInfo.androidInfo; // unique ID on Android
  //   appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  // }
  await Future.delayed(const Duration(seconds: 2));
}

// Future<void> initiInternetChecker() async {
//   InternetConnectionChecker.createInstance(
//           checkTimeout: const Duration(seconds: 1),
//           checkInterval: const Duration(seconds: 2))
//       .onStatusChange
//       .listen((status) {
//     switch (status) {
//       case InternetConnectionStatus.connected:
//         ToastUtil.showShortToast('Data connection is available.');
//         break;
//       case InternetConnectionStatus.disconnected:
//         ToastUtil.showNoInternetToast();
//         break;
//     }
//   });
// }

Future<File> getLocalFile(String filename) async {
  File f = File(filename);
  return f;
}

void showMaterialDialog(BuildContext context) {
  showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text(
            "Do you want to exit the app?",
            textAlign: TextAlign.center,
            // style: TextFontStyle.textStylec11c3A1222DMSans400,
          ),
          actions: <Widget>[
            customeButton(
              name: "No".tr,
              onCallBack: () {
                Navigator.of(context).pop(false);
              },
              height: 30.sp,
              minWidth: .3.sw,
              borderRadius: 30.r,
              color: const Color(0xffFAEDEC),
              textStyle: TextStyle(
                fontSize: 17.sp,
                color: AppColors.allPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
              context: context,
            ),
            customeButton(
              name: "Yes".tr,
              onCallBack: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              height: 30.sp,
              minWidth: .3.sw,
              borderRadius: 30.r,
              color: AppColors.allPrimaryColor,
              textStyle: TextStyle(
                fontSize: 17.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              context: context,
            ),
          ],
        ),
  );
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(80, 0, 0, 0),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Widget customeButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double minWidth,
  required double borderRadius,
  required Color color,
  required TextStyle textStyle,
  required BuildContext context,
  Color? borderColor,
}) {
  return MaterialButton(
    onPressed: onCallBack,
    height: height,
    minWidth: minWidth,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor ?? AppColors.allPrimaryColor,
        width: 1.5.sp,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    color: color,
    //splashColor: Colors.white.withOpacity(0.4),
    child: Text(name, style: textStyle),
  );
}

int opacityToAlpha(double opacity) {
  final clampedOpacity = opacity.clamp(0.0, 1.0);
  return (clampedOpacity * 255).round();
}

Future<XFile?> picImage() async {
  try {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<List<XFile>?> pickMultipleImages() async {
  try {
    final ImagePicker picker = ImagePicker();

    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      return images;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<void> textToSpeech(String text) async {
  try {
    FlutterTts flutterTts = FlutterTts();
    List<dynamic> voices = await flutterTts.getVoices;
    await flutterTts.setVolume(1);
    await flutterTts.speak(text);
  } catch (e) {
    null;
  }
}
Future<dio.MultipartFile?> convertToMultipartFile(XFile? file) async {
  if (file == null) return null;

  return await dio.MultipartFile.fromFile(
    file.path,
    filename: file.name,
  );
}

Future<void> textToChinseSpeech(String text) async {
  try {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage("zh-CN");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);

    List<dynamic> voices = await flutterTts.getVoices;

    var chineseVoice = voices.firstWhere(
      (voice) => voice["locale"] == "zh-CN",
      orElse: () => null,
    );

    if (chineseVoice != null) {
      await flutterTts.setVoice(Map<String, String>.from(chineseVoice));
    }
    await flutterTts.speak(text);
  } catch (e) {
    print("TTS error: $e");
  }
}

String formatDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();
  return '$day/$month/$year';
}
