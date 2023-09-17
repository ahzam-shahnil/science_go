import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Giffy extends StatelessWidget {
  const Giffy({
    super.key,
    required this.assetPath,
  });
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.fill,
      gaplessPlayback: true,
      height: 1.0.sh,
      width: 1.0.sw,
    );
  }
}
