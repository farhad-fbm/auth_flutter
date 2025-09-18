// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '/gen/colors.gen.dart';

// class CustomTabBar extends StatelessWidget {
//   const CustomTabBar({
//     super.key,
//     required this.tab1Text,
//     required this.tab2Text,
//     required this.onTab1Selected,
//     required this.onTab2Selected,
//     required this.showJobDetails,
//     this.sizeTabBarPadding,
//     this.sizeTabBarButtonPadding,
//   });

//   final String tab1Text;
//   final String tab2Text;
//   final VoidCallback onTab1Selected;
//   final VoidCallback onTab2Selected;
//   final bool showJobDetails;
//   final Size? sizeTabBarPadding;
//   final Size? sizeTabBarButtonPadding;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: sizeTabBarPadding?.width ?? 8.w,
//         vertical: sizeTabBarPadding?.height ?? 8.h,
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.cFFFFFF,
//         borderRadius: BorderRadius.circular(30.r),
//       ),
//       child: Row(
//         children: [
//           // Tab 1: Job Details
//           Expanded(
//             child: GestureDetector(
//               onTap: onTab1Selected,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: sizeTabBarButtonPadding?.height ?? 10.h,
//                   horizontal: sizeTabBarButtonPadding?.width ?? 5.w,
//                 ),
//                 decoration: BoxDecoration(
//                   color: showJobDetails
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//                 child: Center(
//                   child: Text(
//                     tab1Text,
//                     style: TextStyle(
//                       color: showJobDetails
//                           ? AppColors.cFFFFFF
//                           : AppColors.c071431,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
          
//           // Tab 2: Preview
//           Expanded(
//             child: GestureDetector(
//               onTap: onTab2Selected,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: sizeTabBarButtonPadding?.height ?? 10.h,
//                   horizontal: sizeTabBarButtonPadding?.width ?? 5.w,
//                 ),
//                 decoration: BoxDecoration(
//                   color: !showJobDetails
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//                 child: Center(
//                   child: Text(
//                     tab2Text,
//                     style: TextStyle(
//                       color: !showJobDetails
//                           ? AppColors.cFFFFFF
//                           : AppColors.c071431,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/colors.gen.dart';

class CustomTabBarC extends StatefulWidget {
  const CustomTabBarC({
    super.key,
    required this.tab1Text,
    required this.tab2Text,
    this. tab3Text,
    required this.onTab1Selected,
     this.onTab2Selected, // ✅ new callback
     this.onTab3Selected,
    required this.showJobDetails,
    this.sizeTabBarPadding,
    this.sizeTabBarButtonPadding,
  });

  final String tab1Text;
  final String tab2Text;
  final String? tab3Text;
  final VoidCallback onTab1Selected;
  final VoidCallback? onTab2Selected; // ✅ new callback
  final VoidCallback? onTab3Selected;
  final bool showJobDetails;
  final Size? sizeTabBarPadding;
  final Size? sizeTabBarButtonPadding;

  @override
  State<CustomTabBarC> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBarC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.sizeTabBarPadding?.width ?? 8.w,
        vertical: widget.sizeTabBarPadding?.height ?? 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          // 🔹 Tab 1
          Expanded(
            child: GestureDetector(
              onTap: widget.onTab1Selected,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
                  horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
                ),
                decoration: BoxDecoration(
                  color: widget.showJobDetails
                      ? AppColors.allPrimaryColor
                      : AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    widget.tab1Text,
                    style: TextStyle(
                      color: widget.showJobDetails
                          ? AppColors.cFFFFFF
                          : AppColors.c071431,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 🔹 Tab 2
          Expanded(
            child: GestureDetector(
              onTap: widget.onTab2Selected, // ✅ fixed
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
                  horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
                ),
                decoration: BoxDecoration(
                  color: !widget.showJobDetails
                      ? AppColors.allPrimaryColor
                      : AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    widget.tab2Text,
                    style: TextStyle(
                      color: !widget.showJobDetails
                          ? Colors.white
                          : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}