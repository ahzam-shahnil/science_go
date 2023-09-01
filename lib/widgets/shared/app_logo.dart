import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.logos.logoLight.path,
      fit: BoxFit.cover,
    );
  }
}
