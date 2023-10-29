import 'dart:async';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:science_go/apis/auth_api.dart';
import 'package:science_go/gen/assets.gen.dart';
import 'package:science_go/views/auth/login_email_screen.dart';
import 'package:science_go/views/home/ar_screen.dart';
import 'package:science_go/views/welcome_screen/welcome_screen.dart';

import '../config/app_constants.dart';
import '../core/utils.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var player = AudioPlayer().obs; // Create a player
  final AuthAPI _authAPI;
  final Duration fadeOutDuration = Duration(seconds: 2);

  late Timer periodicTimer;

  // Stop and free resources
  AuthController({
    required AuthAPI authAPI,
  }) : _authAPI = authAPI;

  @override
  void onInit() {
    super.onInit();
    initPlayer();

    logger.d('Auth Controller Initialed');
    checkAuth();
  }

  initPlayer() async {
    player.value.setVolume(0.45); // Half as loud
    player.value.setLoopMode(LoopMode.one);
    await player.value.setAsset(// Load a URL
        Assets.audio.ambient); // Schemes: (https: | file: | asset: )
    playAudio();
  }

  playAudio() async {
    final currentVolume = player.value.volume;
    if (currentVolume != 0.45) {
      await player.value.setVolume(0.45); // Half as loud
    }

    player.value.play(); // Play without waiting for completion
  }

  stopAudio() async {
    // Fade out the sound over the fadeOutDuration duration.
    periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentVolume = player.value.volume;
      final newVolume = currentVolume - 0.06;
      player.value.setVolume(newVolume);

      if (newVolume <= 0) {
        timer.cancel();
        player.value.pause();
      }
    });
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
        //Stop playing audio when going to Ar Screen
        stopAudio();
        Get.off(() => ArScreen());
      },
    );
  }

  void logout(BuildContext context) async {
    final res = await _authAPI.logout();
    res.fold((l) => null, (r) async {
      await playAudio();
      Get.offAll(() => WelcomeScreen());

      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LogInEmailScreen(),
      //   ),
      //   (route) => false,
      // );
    });
  }

  checkAuth() async {
    var user = await currentUser();
    if (user != null) {
      showSnackBar(Get.context!, 'Already, Logged In');
      //Stop playing audio when going to Ar Screen
      await stopAudio();
      return Get.off(() => ArScreen());
    }
    Get.off(() => const WelcomeScreen());
  }
}
