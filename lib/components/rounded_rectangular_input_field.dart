// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../theme/app_colors.dart';

class RoundedRectangleInputField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textController;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final Iterable<String>? autofillHints;
  final Color? color;
  final bool? isEnabled;
  final double? height;
  final Color? textColor;
  final bool showBorder;
  final ScrollController scrollController = ScrollController();
  RoundedRectangleInputField({
    Key? key,
    required this.hintText,
    this.icon,
    this.onChanged,
    this.textController,
    this.maxLines,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.autofillHints,
    this.color,
    this.isEnabled,
    this.height,
    this.textColor,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: textCapitalization,
      enabled: isEnabled,
      enableIMEPersonalizedLearning: true,
      enableInteractiveSelection: true,
      textInputAction: TextInputAction.next,
      enableSuggestions: true,
      autocorrect: false,
      scrollController: scrollController,
      maxLines: maxLines,
      onChanged: onChanged,
      controller: textController,
      cursorColor: AppColors.mediumGreyTextColor,
      keyboardType: textInputType,
      autofillHints: autofillHints,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 0.055.sw,
            color: textColor ?? AppColors.textColor,
          ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        alignLabelWithHint: true,
        icon: icon != null
            ? Icon(
                icon,
                color: AppColors.goldColor,
              )
            : null,
        hintText: hintText,
        isCollapsed: true,
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.mediumGreyTextColor,
              fontSize: 0.055.sw,
            ),
        hintMaxLines: 1,
        isDense: true,
        border: showBorder
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(30))
            : InputBorder.none,
      ),
      minLines: 1,
    );
  }
}
