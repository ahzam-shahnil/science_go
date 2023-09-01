import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Stack(
        children: [
          // Image.asset(
          //   Assets.images.logos.coverLogo.path,
          //   fit: BoxFit.fill,
          // ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.size.height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.13.sw),
                    child: Image.asset(
                      Assets.images.logos.nameLogo.path,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to Science Go",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800, fontSize: 0.078.sw),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Let's Go",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 0.058.sw),
                    ),
                  ),
                  SizedBox(height: 0.075.sh),
                  const Loader()
                  // RoundedButton(
                  //   bgColor: AppColors.goldColor,
                  //   text: 'Next',
                  //   textColor: AppColors.whiteColor,
                  //   onPressed: () {
                  //     Get.to(() => const LoginWelcomeScreen());
                  //   },
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.goldColor,
      valueColor: AlwaysStoppedAnimation(AppColors.whiteColor),
    );
  }
}
