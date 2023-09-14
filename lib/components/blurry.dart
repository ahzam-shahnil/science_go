import 'dart:ui';

import 'package:flutter/material.dart';

class Blurry extends StatelessWidget {
  const Blurry({
    Key? key,
    required this.child,
    this.sigmaX,
    this.sigmaY,
  }) : super(key: key);
  final double? sigmaX;
  final double? sigmaY;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX ?? 10, sigmaY: sigmaY ?? 10),
          child: child),
    );
  }
}
