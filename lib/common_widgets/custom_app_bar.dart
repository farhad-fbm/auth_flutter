import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/helpers/ui_helpers.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.hasBackButton = true,
  });
  final String title;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBackButton
                ? GestureDetector(
                  onTap: () => NavigationService.goBackCall(),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cFFFFFF,
                      //   borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Image.asset(Assets.icons.arrowLeft.path),
                  ),
                )
                : const SizedBox(),
            Text(title, style: TextFontStyle.textStyle16c071431Poppins600),
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Image.asset(Assets.icons.ukFlag.path),
                ),
                Text(
                  "En",
                  style: TextFontStyle.textStyle16c071431Poppins600.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}


    // AppBar(
    //   centerTitle: true,
    //   automaticallyImplyLeading: false,
    //   leadingWidth: 50.w,

    //   backgroundColor: AppColors.backgroundColor,
    //   title: Text(title, style: TextFontStyle.textStyle16c071431Poppins600),
    //   actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
    //   leading: SafeArea(
    //     child: GestureDetector(
    //       onTap: () => NavigationService.goBackCall(),
    //       child: Container(
    //         // height: 40.h,
    //         // width: 40.w,
    //         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    //         decoration: BoxDecoration(
    //           color: AppColors.cFFFFFF,
    //           borderRadius: BorderRadius.circular(25.r),
    //         ),
    //         child: Image.asset(
    //           Assets.icons.arrowLeft.path,
    //           height: 6.h,
    //           width: 12.w,
    //         ),
    //       ),
    //     ),
    //   ),
    //   actions: [
    //     Row(
    //       children: [
    //         Container(
    //           height: 40.h,
    //           width: 40.w,
    //           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(25.r),
    //           ),
    //           child: Image.asset(Assets.icons.ukFlag.path),
    //         ),
    //         Text(
    //           "En",
    //           style: TextFontStyle.textStyle16c071431Poppins600.copyWith(
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );