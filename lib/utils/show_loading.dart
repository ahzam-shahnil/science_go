// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
      title: "Loading...",
      content: const CircularProgressIndicator.adaptive(),
      barrierDismissible: false);
}

dismissLoadingWidget() {
  Get.back();
}
