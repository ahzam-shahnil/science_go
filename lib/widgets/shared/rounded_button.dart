import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color bgColor;
  final String text;
  final Color textColor;
  final bool? isBorder;
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.bgColor,
    required this.text,
    required this.textColor,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor:
              isBorder == null || isBorder == false ? bgColor : Colors.white,
          side: isBorder != null
              ? isBorder!
                  ? BorderSide(color: textColor)
                  : null
              : null,
        ),
        onPressed: onPressed,
        child: AutoSizeText(text,
            maxLines: 1,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor,
                fontSize: 0.045.sw)));
  }
}
