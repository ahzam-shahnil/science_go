import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/gen/assets.gen.dart';
import 'package:science_go/views/auth/login_email_screen.dart';
import 'package:science_go/views/auth/signup_email_screen.dart';
import 'package:science_go/widgets/shared/app_logo.dart';
import 'package:science_go/widgets/shared/giffy.dart';

import '../../theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Giffy(assetPath: Assets.gif.leaves.path),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.22.sh,
              ),
              child: RoundedAppLogo(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0.03.sh),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          minimumSize: Size(0.45.sw, 50)),
                      onPressed: () {
                        Get.to(() => LogInEmailScreen());
                      },
                      child: AutoSizeText('LOG IN',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textColor,
                                  fontSize: 0.05.sw))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          backgroundColor: AppColors.textColor,
                          minimumSize: Size(0.45.sw, 50)),
                      onPressed: () {
                        Get.to(() => SignUpEmailScreen());
                      },
                      child: AutoSizeText('REGISTER',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.whiteColor,
                                  fontSize: 0.05.sw))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedAppLogo extends StatelessWidget {
  const RoundedAppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.15.sh,
      child: AppLogo(),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.02.sw),
      ),
    );
  }
}
