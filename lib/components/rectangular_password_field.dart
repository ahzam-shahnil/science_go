import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class RectangularPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? textController;
  final Iterable<String>? autofillHints;
  final bool? isReadOnly;
  final Color? color;
  final IconData? icon;
  final String? text;
  final Color? textColor;
  final bool showBorder;
  const RectangularPasswordField(
      {Key? key,
      this.onChanged,
      this.textController,
      this.autofillHints,
      this.isReadOnly,
      this.text,
      this.icon,
      this.color,
      this.textColor,
      this.showBorder = true})
      : super(key: key);

  @override
  State<RectangularPasswordField> createState() =>
      _RectangularPasswordFieldState();
}

class _RectangularPasswordFieldState extends State<RectangularPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscure,
      enableInteractiveSelection: true,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,

      onChanged: widget.onChanged,
      readOnly: widget.isReadOnly ?? false,
      // cursorColor: kActiveBtnColor,
      controller: widget.textController,
      autofillHints: widget.autofillHints,

      // maxLines: 1,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 0.055.sw,
            color: widget.textColor ?? AppColors.textColor,
          ),

      // onEditingComplete: () => TextInput.finishAutofillContext(),
      decoration: InputDecoration(
        isCollapsed: true,

        // hintText:,
        hintText: widget.text ?? "Password",
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.mediumGreyTextColor,
              fontSize: 0.055.sw,
            ),
        hintMaxLines: 1,
        // icon: widget.icon != null
        //     ? Icon(
        //         widget.icon,
        //         color: AppColors.goldColor,
        //       )
        //     : null,

        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          // padding: EdgeInsets.only(top: 0.01.sh),
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: AppColors.goldColor,
            size: 0.07.sw,
          ),
        ),

        border: widget.showBorder
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(30))
            : InputBorder.none,
      ),
    );
  }
}
