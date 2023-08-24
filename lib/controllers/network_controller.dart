// // ignore_for_file: unnecessary_cast

// import 'dart:async';

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../config/app_constants.dart';

// class NetworkController extends GetxService {
//   static NetworkController instance = Get.find();
//   StreamSubscription<ConnectivityResult>? subscription;
//   var isConnectionAvailable = false.obs;

//   @override
//   onInit() {
//     super.onInit();
//     log.d('Network Initilized');
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       log.d(result); //when connection is available
//       if (result != ConnectivityResult.none) {
//         isConnectionAvailable.value = true;
//       }
//       //when connection is not available, we show dialog for
//       else {
//         isConnectionAvailable.value = false;

//         getInfoDialog(
//           dialogType: DialogType.NO_HEADER,
//           btnOkTitle: "Try Again",
//           btnOkOnPress: () {
//             log.d(isConnectionAvailable);
//             if (isConnectionAvailable.value) {
//               Get.back();
//             }
//           },
//           body: Column(
//             children: [
//               SizedBox(
//                 height: 0.1.sh,
//                 width: 0.4.sw,
//                 // child: Image.asset(Assets.images.logoIos.path),
//               ),
//               AutoSizeText(
//                 'Your Connection is Lost',
//                 style: Get.textTheme.titleLarge,
//               ),
//               AutoSizeText(
//                 'Please check your internet connection and try again Try Again',
//                 style: Get.textTheme.titleSmall,
//               ),
//             ],
//           ),
//         ).show();
//       }
//     });
//   }

//   @override
//   void onClose() {
//     log.d("on Network dispose");

//     subscription?.cancel();
//     super.onClose();
//   }
// }
