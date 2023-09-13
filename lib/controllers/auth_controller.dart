import 'dart:async';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:science_go/apis/auth_api.dart';
import 'package:science_go/views/auth/login_email_screen.dart';
import 'package:science_go/views/home/ar_screen.dart';
import 'package:science_go/views/welcome_screen/welcome_screen.dart';

import '../config/app_constants.dart';
import '../core/utils.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final AuthAPI _authAPI;

  AuthController({
    required AuthAPI authAPI,
  }) : _authAPI = authAPI;

  @override
  void onInit() {
    super.onInit();
    logger.d('Auth Controller Initialed');
    checkAuth();
  }

  Future<User?> currentUser() async => _authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final res = await _authAPI.signUpEmail(
      email: email,
      password: password,
    );

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        showSnackBar(context, 'Accounted created! Please login.');
        //TODO: add go to Login Screen Here after Sign Up
        Get.to(() => LogInEmailScreen());
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final res = await _authAPI.login(
      email: email,
      password: password,
    );

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Successfully Logged In');
        //TODO: add got to Home Screen Here after login
        Get.to(() => ArScreen());
      },
    );
  }

  void logout(BuildContext context) async {
    final res = await _authAPI.logout();
    res.fold((l) => null, (r) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LogInEmailScreen(),
        ),
        (route) => false,
      );
    });
  }

  checkAuth() async {
    var user = await currentUser();
    if (user != null) {
      showSnackBar(Get.context!, 'Already, Logged In');
      //TODO: add got to Home Screen Here after login
      return Get.off(() => ArScreen());
    }
    Get.off(() => const WelcomeScreen());
  }
}
