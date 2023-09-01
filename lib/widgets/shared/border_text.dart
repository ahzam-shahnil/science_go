import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class BorderedText extends StatelessWidget {
  const BorderedText({
    super.key,
    required this.text,
    required this.context,
    this.fontSize,
    this.borderColor,
    this.textColor,
    this.fontWeight,
  });

  final String text;
  final double? fontSize;
  final Color? borderColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoSizeText(
          text,
          maxLines: 1,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 0.002.sw
                ..color = borderColor ?? AppColors.textColor,
              fontWeight: fontWeight,
              fontSize: fontSize ?? 50.sp),
        ),
        AutoSizeText(
          text,
          maxLines: 1,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: textColor ?? AppColors.greenColor,
              fontWeight: fontWeight,
              fontSize: fontSize ?? 50.sp),
        ),
      ],
    );
  }
}
