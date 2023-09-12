import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:science_go/widgets/shared/app_logo.dart';

import '../../../components/rectangular_password_field.dart';
import '../../../components/rounded_rectangular_input_field.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/shared/rounded_button.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  bool isEmailUpdateAllowed = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: UIConstants.appBar(),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                    "Sign Up with email",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 0.068.sw,
                        color: AppColors.textColor),
                  ),
                  SizedBox(
                    height: 0.06.sh,
                  ),
                  RoundedRectangleInputField(
                    hintText: 'Name',
                    icon: null,
                    color: AppColors.whiteColor,
                    textController: nameController,
                    textInputType: TextInputType.text,
                    autofillHints: const [AutofillHints.name],
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  RoundedRectangleInputField(
                    hintText: 'Email',
                    icon: null,
                    color: AppColors.whiteColor,
                    textController: emailController,
                    textInputType: TextInputType.text,
                    autofillHints: const [AutofillHints.email],
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  RectangularPasswordField(
                    color: AppColors.whiteColor,
                    autofillHints: const [AutofillHints.password],
                    textController: passwordController,
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 0.35.sw,
                        child: RadioListTile(
                          title: Text(
                            "Yes",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600),
                          ),
                          value: true,
                          groupValue: isEmailUpdateAllowed,
                          onChanged: (value) {
                            setState(() {
                              isEmailUpdateAllowed =
                                  value ?? isEmailUpdateAllowed;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 0.35.sw,
                        child: RadioListTile(
                          title: Text(
                            "No",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600),
                          ),
                          value: false,
                          groupValue: isEmailUpdateAllowed,
                          onChanged: (value) {
                            setState(() {
                              isEmailUpdateAllowed =
                                  value ?? isEmailUpdateAllowed;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  RoundedButton(
                    bgColor: AppColors.lightGreyBtnColor,
                    text: 'Sign Up',
                    textColor: AppColors.mediumGreyTextColor,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
