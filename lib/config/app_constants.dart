import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

// const kProfileCollection = 'profile';
const kAppTitle = 'Naqdina App';
const kTimeOutDuration = 15;
//* width constants

double kHorizontalMargin = 0.075;

//* text style checkbox

final kCheckBoxTextStyle = Get.textTheme.titleLarge
    ?.copyWith(fontSize: Get.size.shortestSide * 0.0358);
final kRegScreenPadding = EdgeInsets.only(left: Get.size.width * 0.1);

//* For debug Printing
Logger log = Logger();

//for Receive email
const kReceiveUpdatesText =
    'Receive updates and notification from Naqdina via email or SMS';
// for Permission Text
const kLocationTitle = 'HELP US FIND YOU?';
const kLocationContent =
    'For Hassle free delivery please allow us to detect your location.';

const kLocationAccessText =
    'This app collects location data to enable identification of nearby available drivers to Restaurants and Order Delivery only when the app is in use.';
const kCameraAccessText =
    'This app collects camera data to enable verification of order delivery by drivers by providing image feedback only when you submit feedback';

const kProminentText =
    '''We track location to connect drivers with orders within their vicinity and to optimize Driver On Deck services. Allowing the Driver app to access a device's location when the app is in use is necessary to enable Driver On Deck to offer delivery opportunities and track the progress and completion of your deliveries. We also share this information with customers and merchants so they can see when drivers are close to a pickup or dropoff location. To use the Driver app, tap 'Continue' then choose 'While using this app' when you're prompted to allow location access. For more information on how Driver On Deck uses location tracking, visit our ''';
const kPolicy = 'Privacy Policy';
