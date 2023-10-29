import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.greenColor),
      title: null,
      centerTitle: true,
      // automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
    );
  }

  // static const List<Widget> bottomTabBarPages = [
  //   TweetList(),
  //   ExploreView(),
  //   NotificationView(),
  // ];
}
