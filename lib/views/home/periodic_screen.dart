import 'package:flutter/material.dart';
import 'package:science_go/gen/assets.gen.dart';
import 'package:science_go/theme/app_colors.dart';

class PeriodicScreen extends StatelessWidget {
  const PeriodicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mediumGreyTextColor,
        title: Text(
          "Periodic Table",
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                Assets.images.periodicTable.path,
                // width: double.infinity,

                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
