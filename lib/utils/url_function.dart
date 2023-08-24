// import 'dart:async';

// import 'package:url_launcher/url_launcher.dart';

// class UrlFunction {
//   static Future<void> launchInWebViewOrVC(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   static Future<void> makePhoneCall({String? phoneNumber}) async {
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber ?? kDODPhone,
//     );
//     if (await canLaunchUrl(launchUri)) {
//       await launchUrl(launchUri);
//     } else {
//       log.e('Could not launch phone');
//     }
//   }

//   static Future<void> launchSms({String? phoneNumber}) async {
//     final Uri smsLaunchUri = Uri(
//       scheme: 'sms',
//       path: phoneNumber ?? kDODPhone,
//       queryParameters: <String, String>{
//         'body': Uri.encodeComponent('Type your message here'),
//       },
//     );
//     if (await canLaunchUrl(smsLaunchUri)) {
//       await launchUrl(smsLaunchUri);
//     } else {
//       log.e('Could not launch sms');
//     }
//   }

//   static Future<void> launchCustomTabUrl(String url) async {
//     final theme = Get.theme;
//     try {
//       await custom_tabs.launch(
//         url,
//         customTabsOption: custom_tabs.CustomTabsOption(
//           toolbarColor: theme.primaryColor,
//           enableDefaultShare: true,
//           enableUrlBarHiding: true,
//           showPageTitle: true,
//           animation: custom_tabs.CustomTabsSystemAnimation.slideIn(),
//           extraCustomTabs: const <String>[
//             // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
//             'org.mozilla.firefox',
//             // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
//             'com.microsoft.emmx',
//           ],
//         ),
//         safariVCOption: custom_tabs.SafariViewControllerOption(
//           preferredBarTintColor: theme.primaryColor,
//           preferredControlTintColor: Colors.white,
//           barCollapsingEnabled: true,
//           entersReaderIfAvailable: false,
//           dismissButtonStyle:
//               custom_tabs.SafariViewControllerDismissButtonStyle.close,
//         ),
//       );
//     } catch (e) {
//       // An exception is thrown if browser app is not installed on Android device.
//       debugPrint(e.toString());
//     }
//   }
// }
