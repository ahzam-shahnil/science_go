import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final Color? color;
  const TextFieldContainer({
    Key? key,
    this.child,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 0.9.sw,
      height: height ?? 0.06.sh,
      decoration: BoxDecoration(
          color: color?.withOpacity(0.29) ?? AppColors.lightestGreyColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.textColor)),
      child: child,
    );
  }
}
