import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:science_go/widgets/shared/app_logo.dart';

import '../../../widgets/shared/rounded_button.dart';
import '../../theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          const AppLogo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.67.sh,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(0.15.sw)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 0.1.sw, vertical: 0.08.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      "Welcome",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 0.078.sw,
                              color: AppColors.textColor),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    RoundedButton(
                      bgColor: AppColors.goldColor,
                      text: 'Login with email',
                      textColor: AppColors.textColor,
                      onPressed: () {
                        // Get.to(() => LogInEmailScreen());
                      },
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    RoundedButton(
                      bgColor: AppColors.whiteColor,
                      text: 'Login with Phone number',
                      textColor: AppColors.textColor,
                      isBorder: true,
                      onPressed: () {
                        // Get.to(() => const LoginPhoneScreen());
                      },
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
