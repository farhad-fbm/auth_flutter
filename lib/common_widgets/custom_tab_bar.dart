// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../gen/colors.gen.dart';

// class CustomTabBar extends StatefulWidget {
//   const CustomTabBar({
//     super.key,
//     required this.tab1Text,
//     required this.tab2Text,
//     this. tab3Text,
//     required this.onTab1Selected,
//      this.onTab2Selected, // ✅ new callback
//      this.onTab3Selected,
//     required this.showJobDetails,
//     this.sizeTabBarPadding,
//     this.sizeTabBarButtonPadding,
//   });

//   final String tab1Text;
//   final String tab2Text;
//   final String? tab3Text;
//   final VoidCallback onTab1Selected;
//   final VoidCallback? onTab2Selected; // ✅ new callback
//   final VoidCallback? onTab3Selected;
//   final bool showJobDetails;
//   final Size? sizeTabBarPadding;
//   final Size? sizeTabBarButtonPadding;

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: widget.sizeTabBarPadding?.width ?? 8.w,
//         vertical: widget.sizeTabBarPadding?.height ?? 8.h,
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.cFFFFFF,
//         borderRadius: BorderRadius.circular(30.r),
//       ),
//       child: Row(
//         children: [
//           // 🔹 Tab 1
//           Expanded(
//             child: GestureDetector(
//               onTap: widget.onTab1Selected,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
//                   horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
//                 ),
//                 decoration: BoxDecoration(
//                   color: widget.showJobDetails
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//                 child: Center(
//                   child: Text(
//                     widget.tab1Text,
//                     style: TextStyle(
//                       color: widget.showJobDetails
//                           ? AppColors.cFFFFFF
//                           : AppColors.c071431,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // 🔹 Tab 2
//           Expanded(
//             child: GestureDetector(
//               onTap: widget.onTab2Selected, // ✅ fixed
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
//                   horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
//                 ),
//                 decoration: BoxDecoration(
//                   color: !widget.showJobDetails
//                       ? AppColors.allPrimaryColor
//                       : AppColors.cFFFFFF,
//                   borderRadius: BorderRadius.circular(30.r),
//                 ),
//                 child: Center(
//                   child: Text(
//                     widget.tab2Text,
//                     style: TextStyle(
//                       color: !widget.showJobDetails
//                           ? Colors.white
//                           : Colors.black87,
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

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tab1Text,
    required this.tab2Text,
    this.tab3Text,
    required this.onTab1Selected,
    this.onTab2Selected,
    this.onTab3Selected,
    required this.selectedTabIndex,
    this.sizeTabBarPadding,
    this.sizeTabBarButtonPadding,
  });

  final String tab1Text;
  final String tab2Text;
  final String? tab3Text;
  final VoidCallback onTab1Selected;
  final VoidCallback? onTab2Selected;
  final VoidCallback? onTab3Selected;
  final int selectedTabIndex;
  final Size? sizeTabBarPadding;
  final Size? sizeTabBarButtonPadding;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
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
                  horizontal: widget.sizeTabBarButtonPadding?.width ?? 1.w,
                ),
                decoration: BoxDecoration(
                  color:
                      widget.selectedTabIndex == 0
                          ? AppColors.allPrimaryColor
                          : AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  widget.tab1Text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:
                        widget.selectedTabIndex == 0
                            ? AppColors.cFFFFFF
                            : AppColors.c071431,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // 🔹 Tab 2
          Expanded(
            child: GestureDetector(
              onTap: widget.onTab2Selected,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
                  horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
                ),
                decoration: BoxDecoration(
                  color:
                      widget.selectedTabIndex == 1
                          ? AppColors.allPrimaryColor
                          : AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  widget.tab2Text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:
                        widget.selectedTabIndex == 1
                            ? AppColors.cFFFFFF
                            : AppColors.c071431,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // 🔹 Tab 3
          Expanded(
            child: GestureDetector(
              onTap: widget.onTab3Selected,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: widget.sizeTabBarButtonPadding?.height ?? 10.h,
                  horizontal: widget.sizeTabBarButtonPadding?.width ?? 5.w,
                ),
                decoration: BoxDecoration(
                  color:
                      widget.selectedTabIndex == 2
                          ? AppColors.allPrimaryColor
                          : AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    widget.tab3Text.toString(),
                    style: TextStyle(
                      color:
                          widget.selectedTabIndex == 2
                              ? AppColors.cFFFFFF
                              : AppColors.c071431,
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
