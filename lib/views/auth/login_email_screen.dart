import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:science_go/widgets/shared/app_logo.dart';

import '../../../components/rectangular_password_field.dart';
import '../../../components/rounded_rectangular_input_field.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/shared/rounded_button.dart';

class LogInEmailScreen extends StatelessWidget {
  LogInEmailScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: UIConstants.appBar(),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                const AppLogo(),
                SizedBox(
                  height: 0.03.sh,
                ),
                AutoSizeText(
                  "Login with email",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 0.068.sw,
                      color: AppColors.textColor),
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: RoundedRectangleInputField(
                    hintText: 'Email',
                    icon: null,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: RectangularPasswordField(
                    color: AppColors.whiteColor,
                    autofillHints: const [AutofillHints.password],
                    textController: passwordController,
                  ),
                ),
                SizedBox(
                  height: 0.06.sh,
                ),
              
                const Spacer(),
                RoundedButton(
                    onPressed: () {
                      
                    },
                    bgColor: AppColors.lightGreyBtnColor,
                    text: 'Log in',
                    textColor: AppColors.mediumGreyTextColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
