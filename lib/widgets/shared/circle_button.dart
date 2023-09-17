import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final void Function()? onPressed;
  final Icon icon;
  final Color? bgColor;
  const CircleButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: const CircleBorder(), //<-- SEE HERE
        padding: const EdgeInsets.all(8),
        backgroundColor: bgColor,
      ),
      icon: icon,
    );
  }
}
