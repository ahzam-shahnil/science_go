import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'text_field_container.dart';

class RoundTextFormField extends StatelessWidget {
  RoundTextFormField(
      {Key? key,
      required this.hintText,
      this.icon,
      this.onChanged,
      this.textController,
      this.maxLines,
      required this.textCapitalization,
      this.textInputType,
      this.autofillHints,
      this.isEnabled,
      this.height,
      this.validator})
      : super(key: key);

  final String hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textController;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;
  // TextEditingController? controller,

  final bool? isEnabled;
  final double? height;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      height: height,
      child: TextFormField(
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
        validator: validator,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.textColor,
            ),
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  color: AppColors.goldColor,
                )
              : null,
          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.mediumGreyTextColor,
              fontSize: 0.035.sw),
          hintText: hintText,
          border: InputBorder.none,
        ),
        minLines: 1,
      ),
    );
  }
}
