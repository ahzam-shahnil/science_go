// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../theme/app_colors.dart';
// import '../widgets/shared/ripple_animater.dart';

// class LoadingAnimation extends StatelessWidget {
//   const LoadingAnimation({
//     Key? key,
//     this.widget,
//   }) : super(key: key);
//   final Widget? widget;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: RippleAnimater(
//             rippleColor: AppColors.greenColor,
//             widget: SizedBox(
//               height: 0.4.sh,
//               child: widget ??
//                   Image.asset(
//                     //TODO: add image here
//                     "Assets.images.logo.path",
//                     fit: BoxFit.contain,
//                     width: 0.3.sw,
//                     height: 0.3.sw,
//                     color: Colors.white,
//                     alignment: Alignment.center,
//                   ),
//             )));
//   }
// }
