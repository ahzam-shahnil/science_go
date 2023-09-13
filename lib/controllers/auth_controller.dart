// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';



// import '../config/app_constants.dart';
// import '../core/utils.dart';
// import '../views/splash/splash_screen.dart';


// class AuthController extends GetxController {
//   static AuthController instance = Get.find();

//   final AuthAPI _authAPI;
//   final UserAPI _userAPI;

//   AuthController({
//     required AuthAPI authAPI,
//     required UserAPI userAPI,
//   })  : _authAPI = authAPI,
//         _userAPI = userAPI;

//   // signInWithProvider({required String provider}) async {
//   //   try {
//   //     final session = await account.createOAuth2Session(provider: provider);
//   //     currentUser = await account.get();
//   //     status = AuthStatus.authenticated;
//   //     return session;
//   //   } finally {
//   //     // notifyListeners();
//   //   }
//   // }

//   // Future<Preferences> getUserPreferences() async {
//   //   return await account.getPrefs();
//   // }

//   // updatePreferences({required String bio}) async {
//   //   return account.updatePrefs(prefs: {'bio': bio});
//   // }

//   @override
//   void onInit() {
//     super.onInit();
//     log.d('Auth Controller Initialed');
//     checkAuth();
//   }

//   Future<User?> currentUser() async => _authAPI.currentUserAccount();

//   void signUp({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     final res = await _authAPI.signUp(
//       email: email,
//       password: password,
//     );

//     res.fold(
//       (l) => showSnackBar(context, l.message),
//       (r) async {
//         UserModel userModel = UserModel(
//           email: email,
//           name: getNameFromEmail(email),
//           followers: const [],
//           following: const [],
//           profilePic: '',
//           bannerPic: '',
//           uid: r.$id,
//           bio: '',
//           isTwitterBlue: false,
//         );
//         final res2 = await _userAPI.saveUserData(userModel);
//         res2.fold((l) => showSnackBar(context, l.message), (r) {
//           showSnackBar(context, 'Accounted created! Please login.');
//           Get.to(() => const SplashScreen());
//         });
//       },
//     );
//   }

//   void login({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     final res = await _authAPI.login(
//       email: email,
//       password: password,
//     );

//     res.fold(
//       (l) => showSnackBar(context, l.message),
//       (r) {
//         Get.to(() => const LoginWelcomeScreen());
//       },
//     );
//   }

//   Future<UserModel> getUserData(String uid) async {
//     final document = await _userAPI.getUserData(uid);
//     final updatedUser = UserModel.fromMap(document.data);
//     return updatedUser;
//   }

//   void logout(BuildContext context) async {
//     final res = await _authAPI.logout();
//     res.fold((l) => null, (r) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const LoginPhoneScreen(),
//         ),
//         (route) => false,
//       );
//     });
//   }

//   checkAuth() async {
//     var user = await currentUser();
//     if (user != null) {
//       return Get.off(() => const HomeScreen());
//     }
//     Get.off(() => const SignUpWelcomeScreen());
//   }
// }
