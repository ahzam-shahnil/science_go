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
      assetPath: Assets.images.cell.path,
      onTap: () {
        logger.i('Animal cell pressed!');
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
        arController.onLocalObjectAtOriginButtonPressed(
            'Models/human/heart/heart.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.plantCell.path,
      onTap: () {
        logger.i('Plant Cell pressed!');
        Get.back();
        arController.onLocalObjectAtOriginButtonPressed(
            'Models/human/plant_cell/plant_cell.gltf');
        // arController.onWebObjectAtOriginButtonPressed(
        //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb");
      },
    ),
    ArImageTile(
      assetPath: Assets.images.brain.path,
      onTap: () {
        logger.i('Brain pressed!');
        Get.back();
        arController.onLocalObjectAtOriginButtonPressed(
            'Models/human/brain/brain.gltf');
        // arController.onWebObjectAtOriginButtonPressed(
        //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb");
      },
    ),
    ArImageTile(
      assetPath: Assets.images.volcano.path,
      onTap: () {
        logger.i('Volcano pressed!');
        Get.back();
        arController
            .onLocalObjectAtOriginButtonPressed('Models/volcano/volcano.gltf');
        // arController.onWebObjectAtOriginButtonPressed(
        //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb");
      },
    ),
    ArImageTile(
      assetPath: Assets.images.skeleton.path,
      onTap: () {
        logger.i('Skeleton pressed!');
        Get.back();
        arController.onLocalObjectAtOriginButtonPressed(
            'Models/skeleton/skeleton.gltf');
      },
    ),
    ArImageTile(
      assetPath: Assets.images.apatosaurus.path,
      onTap: () {
        logger.i('Dino pressed!');
        Get.back();
        arController.onLocalObjectAtOriginButtonPressed(
            'Models/dino/apatosaurus/apatosaurus.gltf');
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
