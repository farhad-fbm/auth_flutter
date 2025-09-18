// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '/constants/text_font_style.dart';

// import '../gen/colors.gen.dart';

// class CustomSwitchTile extends StatelessWidget {
//   final String title;
//   final bool value;
//   final ValueChanged<bool> onChanged;

//   const CustomSwitchTile({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: TextFontStyle.textStyle24c385B66Quicksand500),
//           CustomToggle(value: value, onChanged: onChanged),
//         ],
//       ),
//     );
//   }
// }

// class CustomToggle extends StatefulWidget {
//   final bool value;
//   final ValueChanged<bool> onChanged;

//   const CustomToggle({super.key, required this.value, required this.onChanged});

//   @override
//   State<CustomToggle> createState() => _CustomToggleState();
// }

// class _CustomToggleState extends State<CustomToggle> {
//   late bool _value;
//   @override
//   void initState() {
//     _value = widget.value;
//     super.initState();
//   }

//   void _toggleValue() {
//     setState(() {
//       _value = !_value;
//     });
//     widget.onChanged(_value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _toggleValue();
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: 30.w,
//         height: 21.h,
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.r),
//           color: _value ? AppColors.c69969B : AppColors.cB3DFDD,
//         ),
//         child: Align(
//           alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
//           child: Container(
//             width: 10.w,
//             height: 10.h,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: _value ? AppColors.cB3DFDD : AppColors.c69969B,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
