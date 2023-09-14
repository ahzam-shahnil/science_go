import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/components/blurry.dart';

import '../../gen/assets.gen.dart';
import '../../theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/gif/lake.gif',
            fit: BoxFit.fill,
            height: 1.0.sh,
            width: 1.0.sw,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.size.height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                    child: Blurry(
                      sigmaX: 3,
                      sigmaY: 3,
                      child: Image.asset(
                        Assets.images.logos.nameLogo.path,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  Blurry(
                    sigmaX: 2,
                    sigmaY: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Learning Science With Ar",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 0.078.sw,
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Let's Go",
                  //     textAlign: TextAlign.center,
                  //     style: Get.textTheme.displayMedium?.copyWith(
                  //         fontWeight: FontWeight.w600, fontSize: 0.058.sw),
                  //   ),
                  // ),
                  SizedBox(height: 0.075.sh),
                  const Loader()
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
      backgroundColor: AppColors.whiteColor,
      valueColor: AlwaysStoppedAnimation(AppColors.whiteColor),
    );
  }
}
