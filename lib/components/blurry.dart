import 'dart:ui';

import 'package:flutter/material.dart';

class Blurry extends StatelessWidget {
  const Blurry({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: widget),
    );
  }
}
