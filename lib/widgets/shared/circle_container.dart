import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double radius;
  final Color color;

  const CircularContainer({
    Key? key,
    required this.radius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
