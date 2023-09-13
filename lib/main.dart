import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/bindings/initial_binding.dart';
import 'package:science_go/theme/app_theme.dart';
import 'package:science_go/views/splash/splash_screen.dart';

import 'config/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppTitle,
          // navigatorKey: MyApp.navigatorKey,
          defaultTransition: Transition.native,
          theme: AppTheme.theme,
          home: child,
          initialBinding: InitialBinding(),
          // builder: EasyLoading.init(),
        );
      },
      child: SplashScreen(),
    );
  }
}
