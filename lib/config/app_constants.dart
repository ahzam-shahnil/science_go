import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

// const kProfileCollection = 'profile';
const kAppTitle = 'Science Go';
const kTimeOutDuration = 15;
//* width constants

double kHorizontalMargin = 0.075;

//* text style checkbox

final kCheckBoxTextStyle = Get.textTheme.titleLarge
    ?.copyWith(fontSize: Get.size.shortestSide * 0.0358);
final kRegScreenPadding = EdgeInsets.only(left: Get.size.width * 0.1);

//* For debug Printing
Logger logger = Logger();

// for Permission Text
const kCameraAccessText =
    'This app collects camera data to enable verification of order delivery by drivers by providing image feedback only when you submit feedback';

const kPolicy = 'Privacy Policy';
