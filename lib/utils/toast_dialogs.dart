// // Flutter imports:
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// // Package imports:
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';

// import '../config/app_constants.dart';
// import '../theme/app_colors.dart';

// void showSnackBar(
//     {required String msg,
//     Color? backColor,
//     String? titleMsg,
//     Color? textColor,
//     IconData? iconData}) {
//   Get.snackbar(
//     "",
//     '',
//     icon: iconData != null
//         ? Icon(
//             iconData,
//             color: textColor ?? AppColors.textColor,
//           )
//         : null,
//     snackPosition: SnackPosition.TOP,
//     backgroundColor: backColor ?? AppColors.lightestGreyColor,
//     borderRadius: 12,
//     margin: const EdgeInsets.all(4),
//     colorText: textColor ?? AppColors.textColor,
//     titleText: Center(
//       child: Text(msg,
//           style: Get.textTheme.bodyLarge
//               ?.copyWith(color: textColor ?? AppColors.textColor)),
//     ),
//     duration: const Duration(seconds: 3),
//     isDismissible: true,
//     dismissDirection: DismissDirection.horizontal,
//     forwardAnimationCurve: Curves.easeOutBack,
//   );
// }

// void showToast({required String msg, Color? backColor, Color? textColor}) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.CENTER,
//     timeInSecForIosWeb: 1,
//     backgroundColor: backColor ?? Colors.red,
//     textColor: textColor ?? Colors.white,
//   );
// }

// AwesomeDialog getErrorDialog({Widget? body, String? desc}) {
//   return AwesomeDialog(
//     context: Get.context!,
//     isDense: true,
//     padding: const EdgeInsets.symmetric(horizontal: 2),
//     dialogType: DialogType.ERROR,
//     animType: AnimType.RIGHSLIDE,
//     headerAnimationLoop: false,
//     title: 'Error',
//     body: body,
//     desc: desc,
//     btnOkOnPress: () {
//       Get.back();
//     },
//     btnOkIcon: Icons.cancel,
//     btnOkColor: Colors.red,
//   );
// }

// AwesomeDialog getSuccessDialog({Widget? body, String? desc}) {
//   return AwesomeDialog(
//     context: Get.context!,
//     dialogType: DialogType.success,
//     animType: AnimType.rightSlide,
//     isDense: true,
//     padding: EdgeInsets.zero,
//     headerAnimationLoop: false,
//     title: 'Success',
//     body: body,
//     desc: desc,
//     btnOkOnPress: () {
//       Get.back();
//     },
//     btnOkIcon: Icons.check_circle_outline_rounded,
//     btnOkColor: AppColors.blueColor,
//   );
// }

// AwesomeDialog getInfoDialog(
//     {Widget? body,
//     String? desc,
//     String? title,
//     String? btnOkTitle,
//     DialogType? dialogType,
//     void Function()? btnOkOnPress}) {
//   return AwesomeDialog(
//     context: Get.context!,
//     dialogType: dialogType ?? DialogType.info,
//     animType: AnimType.RIGHSLIDE,
//     isDense: true,
//     padding: EdgeInsets.zero,
//     autoDismiss: false,
//     onDismissCallback: (type) {
//       logger.d(type);
//     },
//     dismissOnBackKeyPress: false,
//     headerAnimationLoop: false,
//     title: title ?? 'Info',
//     body: body,
//     desc: desc,
//     btnOkText: btnOkTitle,
//     btnOkOnPress: btnOkOnPress ??
//         () {
//           Get.back();
//         },
//     btnOkIcon: Icons.check_circle_outline_rounded,
//     btnOkColor: AppColors.blueColor,
//   );
// }
