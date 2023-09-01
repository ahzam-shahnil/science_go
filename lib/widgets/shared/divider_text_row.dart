import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class DividerTextRow extends StatelessWidget {
  final String text;
  const DividerTextRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: AppColors.mediumGreyTextColor,
          width: 0.2.sw,
          height: 0.5,
        ),
        AutoSizeText(
          text,
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.mediumGreyTextColor,
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
        ),
        Container(
          color: AppColors.mediumGreyTextColor,
          width: 0.2.sw,
          height: 0.5,
        ),
      ],
    );
  }
}
