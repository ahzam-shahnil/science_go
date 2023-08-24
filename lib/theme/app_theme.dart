import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/theme/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blueColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: const ColorScheme.light(
      background: AppColors.whiteColor,
    ),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: AppColors.reddishColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textColor, fontSize: 28),
      displayMedium: TextStyle(color: AppColors.textColor, fontSize: 26),
      displaySmall: TextStyle(color: AppColors.textColor, fontSize: 24),
      headlineMedium: TextStyle(color: AppColors.textColor, fontSize: 22),
      headlineSmall: TextStyle(color: AppColors.textColor, fontSize: 20),
      titleLarge: TextStyle(color: AppColors.textColor, fontSize: 18),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor),
      bodyLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor),
      bodyMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor),
      labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor),
      bodySmall: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor),
      labelSmall: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        elevation: 1,
        textStyle:
            Get.textTheme.bodyMedium?.copyWith(color: AppColors.textColor),
        minimumSize: Size(0.75.sw, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
            fontSize: Get.textTheme.bodyMedium?.fontSize,
            color: AppColors.textColor),
        minimumSize: Size(0.75.sw, 50),
        side: const BorderSide(color: AppColors.textColor, width: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    useMaterial3: true,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.whiteColor,
      foregroundColor: AppColors.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
    ),
  );
}
