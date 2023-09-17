import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:science_go/config/app_constants.dart';
import 'package:science_go/config/controllers.dart';
import 'package:science_go/gen/assets.gen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
    this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Image.asset(Assets.images.logos.nameLogo.path),
          ),
          ListTile(
              leading: const Icon(Icons.feedback_rounded),
              horizontalTitleGap: 8,
              focusColor: Colors.grey,
              title: const Text('Ratings'),
              onTap: () {
                logger.d('ratings pressed');
              }),
          ListTile(
            leading: const Icon(Icons.policy_rounded),
            horizontalTitleGap: 8,
            focusColor: Colors.grey,
            title: const Text('Terms & Policy'),
            onTap: () {
              logger.d('Policies pressed');
            },
          ),
          ListTile(
              leading: const Icon(Icons.logout_rounded),
              horizontalTitleGap: 8,
              focusColor: Colors.grey,
              title: const Text('Log Out'),
              onTap: () {
                authController.logout(context);
              }),
          ListTile(
            leading: const Icon(Icons.power_settings_new),
            focusColor: Colors.grey,
            title: const Text('Exit'),
            horizontalTitleGap: 8,
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text('Exit App'),
                actions: [
                  TextButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: const Text('YES')),
                  TextButton(
                      onPressed: () => Get.back(), child: const Text('NO'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
