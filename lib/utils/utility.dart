// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:jiffy/jiffy.dart';

// class Utility {
//   static void enterFullScreen() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   }

//   static void exitFullScreen() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//   }

//   static formatTime(DateTime date) {
//     return Jiffy(date).jm;
//   }

//   static DateTime combine(DateTime date, TimeOfDay? time) => DateTime(
//       date.year, date.month, date.day, time?.hour ?? 0, time?.minute ?? 0);

//   static String formatDateRange(DateTime date1, DateTime date2) {
//     final sameMonth = date1.month == date2.month;
//     final sameYear = date1.year == date2.year;
//     final format = DateFormat.MMMd();
//     if (sameMonth && sameYear) {
//       return "${format.format(date1)}-${date2.day}";
//     } else if (sameYear) {
//       return "${format.format(date1)} - ${format.format(date2)}";
//     } else {
//       return "${format.format(date1)} - ${format.format(date2)}";
//     }
//   }
// }
