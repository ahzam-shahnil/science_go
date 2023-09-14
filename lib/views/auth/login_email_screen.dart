import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:science_go/config/controllers.dart';
import 'package:science_go/views/welcome_screen/welcome_screen.dart';

import '../../../components/rectangular_password_field.dart';
import '../../../components/rounded_rectangular_input_field.dart';
import '../../../theme/app_colors.dart';

class LogInEmailScreen extends StatelessWidget {
  LogInEmailScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: UIConstants.appBar(),
      // extendBodyBehindAppBar: true,

      // extendBody: true,

      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/gif/starry.gif',
                      height: 1.sh,
                    ).image)),
            child: SingleChildScrollView(
              primary: true,
              child: Container(
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    RoundedAppLogo(),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    AutoSizeText(
                      "LOG IN",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 0.068.sw,
                              color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: RoundedRectangleInputField(
                        hintText: 'Email',
                        icon: null,
                        filledColor: AppColors.whiteColor,
                        color: AppColors.whiteColor,
                        textController: emailController,
                        textInputType: TextInputType.text,
                        autofillHints: const [AutofillHints.email],
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: RectangularPasswordField(
                        color: AppColors.textColor,
                        filledColor: AppColors.whiteColor,
                        autofillHints: const [AutofillHints.password],
                        textController: passwordController,
                      ),
                    ),
                    SizedBox(
                      height: 0.06.sh,
                    ),
                    // const Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            minimumSize: Size(0.45.sw, 50)),
                        onPressed: () => authController.login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context),
                        child: AutoSizeText('LOG IN',
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
            ),
          ),
        ),
      ),
    );
  }
}
