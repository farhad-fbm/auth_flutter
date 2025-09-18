import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants/text_font_style.dart';
import '/gen/assets.gen.dart';
import '/gen/colors.gen.dart';
import '/helpers/navigation_service.dart';
import '/helpers/ui_helpers.dart';

//ignore: must_be_immutable
class CustomScaffold extends StatefulWidget {
  Widget body;
  Widget? appBar;
  String? pageTitle;
  Function? onbackButtonPressed;
  TextStyle? pageTitleStyle;
  bool centerTitle;
  bool enableScrolling;
  String? backgroundImage;
  bool hasBackButton;
  double appbarGap;
  bool? isCustomAppBar;
  CustomScaffold({
    this.pageTitle,
    this.onbackButtonPressed,
    this.appBar,
    this.pageTitleStyle,
    required this.body,
    this.enableScrolling = true,
    this.centerTitle = true,
    this.backgroundImage,
    this.hasBackButton = true,
    this.appbarGap = 30,
    this.isCustomAppBar = false,
    super.key,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),

        child: SafeArea(
          child: Column(
            children: [
              if (widget.appBar == null) ...[
                //&& widget.hasBackButton == true
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (widget.hasBackButton)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: AppColors.cFFFFFF,
                          radius: 24.h,
                          child: IconButton(
                            constraints: const BoxConstraints(
                              minWidth: 48,
                              minHeight: 48,
                            ),
                            padding: EdgeInsets.zero,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              if (widget.onbackButtonPressed != null) {
                                widget.onbackButtonPressed!();
                              } else if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: AppColors.c000000CC,
                              size: 30.h,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                if (widget.isCustomAppBar == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => NavigationService.goBackCall(),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Image.asset(Assets.icons.arrowLeft.path),
                        ),
                      ),
                      if (widget.pageTitle != null)
                        Text(
                          widget.pageTitle!,
                          style: TextFontStyle.textStyle16c071431Poppins600,
                        ),
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
                            style: TextFontStyle.textStyle16c071431Poppins600
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),

                UIHelper.verticalSpace(widget.appbarGap.h),
              ] else if (widget.appBar != null) ...[
                widget.appBar!,
                UIHelper.verticalSpace(widget.appbarGap.h),
              ] else ...[
                const SizedBox(),
              ],

              widget.enableScrolling
                  ? Expanded(child: SingleChildScrollView(child: widget.body))
                  : Expanded(child: widget.body),
            ],
          ),
        ),
      ),
    );
  }
}
