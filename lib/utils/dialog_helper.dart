// Flutter imports:

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Package imports:
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class DialogHelper {
  //show error dialog
  static void showDialog(
      {required String title,
      String? description,
      String? okBtnText,
      void Function()? onPressed}) {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium
                    ?.copyWith(color: AppColors.textColor),
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge
                    ?.copyWith(color: AppColors.textColor),
              ),
              Expanded(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (Get.isDialogOpen!) Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: onPressed,
                      child: Text(okBtnText ?? 'OK'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static AwesomeDialog getAwesomeDialog(
      {required String title,
      String? description,
      String? okBtnText,
      void Function()? onPressed}) {
    return AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.infoReverse,

      isDense: true,
      padding: EdgeInsets.zero,

      // width: 0.,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: title,
      titleTextStyle: Get.textTheme.titleLarge
          ?.copyWith(color: AppColors.textColor, fontSize: 20.sp),
      desc: description,
      showCloseIcon: true,
      btnCancelOnPress: () {
        Get.back();
      },
      btnOk: TextButton(onPressed: onPressed, child: Text(okBtnText ?? 'OK')),
    );
  }
}
