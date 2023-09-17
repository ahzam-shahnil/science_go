// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/config/app_constants.dart';
import 'package:science_go/config/controllers.dart';
import 'package:science_go/theme/app_colors.dart';
import 'package:science_go/utils/color_extension.dart';

import '../../gen/assets.gen.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final List<Widget> itemList = [
    ArImageTile(
      assetPath: Assets.images.white.path,
      onTap: () {
        logger.i('White pressed!');
        Get.back();

        arController
            .onLocalObjectAtOriginButtonPressed('Models/white/white.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.red.path,
      onTap: () {
        logger.i('red pressed!');
        Get.back();
        arController.onLocalObjectAtOriginButtonPressed('Models/red/red.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.green.path,
      onTap: () {
        logger.i('green pressed!');
        Get.back();
        arController
            .onLocalObjectAtOriginButtonPressed('Models/green/green.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.cell.path,
      onTap: () {
        logger.i('cell pressed!');
        Get.back();
        arController
            .onLocalObjectAtOriginButtonPressed('Models/animal_cell/cell.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.heart.path,
      onTap: () {
        logger.i('Heart pressed!');
        Get.back();
        arController
            .onLocalObjectAtOriginButtonPressed('Models/heart/heart.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.duck.path,
      onTap: () {
        logger.i('Duck pressed!');
        Get.back();
        arController
            .onLocalObjectAtOriginButtonPressed('Models/duck/Duck.gltf');
        // arController.onWebObjectAtOriginButtonPressed(
        //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBtnColor.lighten(),
      appBar: AppBar(
        title: Text("Explore Models"),
        backgroundColor: AppColors.mediumGreyTextColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: itemList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArImageTile extends StatelessWidget {
  const ArImageTile({
    Key? key,
    this.onTap,
    this.height,
    this.width,
    required this.assetPath,
  }) : super(key: key);
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          assetPath,
          height: height ?? 0.2.sh,
          width: width ?? 0.2.sw,
          fit: BoxFit.fill,
        ));
  }
}
