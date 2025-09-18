// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import '/common_widgets/custom_button.dart';
// import '/common_widgets/or.dart';
// import '/constants/text_font_style.dart';
// import '/gen/assets.gen.dart';
// import '/gen/colors.gen.dart';
// import '/helpers/helper_methods.dart';
// import '/helpers/ui_helpers.dart';

// class UploadImageCard extends StatefulWidget {
//   String? lableTex;
//   String? imagePath;
//   ValueChanged<XFile> onPicked;
//   ValueChanged onClear;
//   UploadImageCard({
//     required this.onPicked,
//     this.lableTex,
//     this.imagePath,
//     required this.onClear,
//     super.key,
//   });

//   @override
//   State<UploadImageCard> createState() => _UploadImageCardState();
// }

// class _UploadImageCardState extends State<UploadImageCard> {
//   String imagetitle = "";

//   imageTitle(String imagePath) {
//     List<String> paths = imagePath.split("/");
//     return paths.last;
//   }

//   @override
//   Widget build(BuildContext context) {
//     imagetitle = imageTitle(widget.imagePath ?? "");
//     int opacity = opacityToAlpha(.6);
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             widget.lableTex ?? "",
//             style: TextFontStyle.textStyle20c385B66Manrope700,
//           ),
//         ),
//         UIHelper.verticalSpace(widget.lableTex == null ? 0.h : 20.h),
//         DottedBorder(
//           options: RoundedRectDottedBorderOptions(
//             color: AppColors.c385B66.withAlpha(opacityToAlpha(60)),
//             dashPattern: [5, 5],
//             strokeWidth: 1,
//             radius: const Radius.circular(20),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 25.h),
//             child: SizedBox(
//               width: double.infinity,
//               height: 260.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   widget.imagePath == null
//                       ? CircleAvatar(
//                         radius: 40,
//                         backgroundColor: AppColors.cF0F0F0,
//                         child: Image.asset(
//                           Assets.icons.uploadIcon.path,
//                           width: 20.w,
//                           height: 16.h,
//                         ),
//                       )
//                       : CircleAvatar(
//                         radius: 50,
//                         backgroundColor: AppColors.cF0F0F0,
//                         backgroundImage: FileImage(File(widget.imagePath!)),
//                       ),

//                   widget.imagePath == null
//                       ? Column(
//                         children: [
//                           Text(
//                             "Tap to upload photo",
//                             style: TextFontStyle.textStyle16c6AB4A7Manrope700,
//                           ),

//                           Text(
//                             "PNG, JPG (max 800x400px)",
//                             style: TextFontStyle.textStyle14c6AB4A7Manrope500,
//                           ),
//                           UIHelper.verticalSpace(15.h),
//                           orline(),
//                           UIHelper.verticalSpace(15.h),
//                           customButton(
//                             height: 42.h,
//                             width: 100.w,

//                             title: "Camera",
//                             onPressed: () async {
//                               XFile? file = await picImage();
//                               if (file != null) {
//                                 widget.onPicked.call(file);
//                               }
//                             },
//                           ),
//                         ],
//                       )
//                       : Column(
//                         children: [
//                           Text(
//                             "Upload Complete",
//                             style: TextFontStyle.textStyle16c000000Manrope700,
//                           ),
//                           UIHelper.verticalSpace(12.5),
//                           Text(
//                             imagetitle,
//                             style: TextFontStyle.textStyle14c6AB4A7Manrope500
//                                 .copyWith(
//                                   color: AppColors.c385B66.withAlpha(opacity),
//                                 ),
//                           ),
//                           UIHelper.verticalSpace(12.5),
//                           _clearImage(),
//                         ],
//                       ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _clearImage() {
//     return InkWell(
//       onTap: () {
//         widget.imagePath = null;
//         widget.onClear(widget.imagePath);
//         setState(() {});
//       },
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(Assets.icons.delete.path, height: 24.h, width: 24.w),
//           UIHelper.horizontalSpace(5.w),
//           Text(
//             "Clear Upload",
//             style: TextFontStyle.textStyle14c385B66Quicksand600,
//           ),
//         ],
//       ),
//     );
//   }
// }
