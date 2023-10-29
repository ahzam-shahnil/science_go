import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:science_go/config/controllers.dart';
import 'package:science_go/gen/assets.gen.dart';
import 'package:science_go/theme/app_colors.dart';
import 'package:science_go/utils/color_extension.dart';
import 'package:science_go/views/home/explore_screen.dart';
import 'package:science_go/views/home/widgets/home_drawer.dart';
import 'package:science_go/widgets/shared/circle_container.dart';

import '../../config/app_constants.dart';

class ArScreen extends StatefulWidget {
  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // extendBody: true,
      // backgroundColor: AppColors.greenColor.lighten(),
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          ARView(
            onARViewCreated: arController.onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Positioned(
              bottom: 0.07.sh,
              left: 0,
              right: 0,
              child: CircularContainer(
                radius: 0.08.sw,
                color: AppColors.textColor.lighten(),
              )),
          Positioned(
              bottom: 0.1.sh,
              left: 0.3.sw,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  logger.d('Ar button Pressed');
                  arController.toggleArBtn();
                },
                child: Image.asset(
                  Assets.images.arBtn.path,
                  height: 0.15.sw,
                  width: 0.15.sw,
                ),
              )),
          Obx(() => Positioned(
                bottom: 0.28.sh,
                left: 0,
                right: 0,
                child: Visibility(
                  visible: arController.isArButtonShown.value,
                  child: TextButton(
                      onPressed: () {
                        logger.d('Upward pressed');
                        Get.to(() => ExploreScreen());
                      },
                      child: Image.asset(
                        Assets.images.arrow.path,
                        height: 0.15.sw,
                        width: 0.15.sw,
                      )),
                ),
              )),
          Positioned(
            bottom: 0.18.sh,
            left: 0,
            right: 0,
            child: Obx(
              () => Visibility(
                visible: arController.isArButtonShown.value,
                child: Container(
                  color: AppColors.textColor.lighten(7).withOpacity(0.5),
                  padding: EdgeInsets.symmetric(vertical: 0.01.sh),
                  child: LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      primary: true,
                      physics: ScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: viewportConstraints.maxWidth,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.plantCell.path,
                              onTap: () {
                                logger.i('Plant Cell pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/human/plant_cell/plant_cell.gltf');
                              },
                            ),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.brain.path,
                              onTap: () {
                                logger.i('Brain pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/human/brain/brain.gltf');
                              },
                            ),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.volcano.path,
                              onTap: () {
                                logger.i('Volcano pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/volcano/volcano.gltf');
                              },
                            ),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.cell.path,
                              onTap: () {
                                logger.i('Animal cell pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/animal_cell/cell.gltf');
                              },
                            ),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.heart.path,
                              onTap: () {
                                logger.i('Heart pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/human/heart/heart.gltf');
                              },
                            ),

                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.skeleton.path,
                              onTap: () {
                                logger.i('Skeleton pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/skeleton/skeleton.gltf');
                              },
                            ),
                            SizedBox(
                              width: 0.03.sw,
                            ),
                            ArImageTile(
                              height: 0.09.sh,
                              width: 0.18.sw,
                              assetPath: Assets.images.apatosaurus.path,
                              onTap: () {
                                logger.i('Dino pressed!');

                                arController.onLocalObjectAtOriginButtonPressed(
                                    'Models/dino/apatosaurus/apatosaurus.gltf');
                              },
                            ),

                            // SizedBox(
                            //   width: 0.03.sw,
                            // ),
                            // ArImageTile(
                            //   height: 0.09.sh,
                            //   width: 0.18.sw,
                            //   assetPath: Assets.images.skeleton.path,
                            //   onTap: () {
                            //     logger.i('skeleton pressed!');

                            //     arController.onLocalObjectAtOriginButtonPressed(
                            //         'Models/skeleton/skeleton.gltf');
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 0.03.sw,
                            // ),
                            // ArImageTile(
                            //   height: 0.09.sh,
                            //   width: 0.18.sw,
                            //   assetPath: Assets.images.apatosaurus.path,
                            //   onTap: () {
                            //     logger.i('Dino pressed!');

                            //     arController.onLocalObjectAtOriginButtonPressed(
                            //         'Models/dino/apatosaurus/apatosaurus.gltf');
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 0.03.sw,
                            // ),
                            // ArImageTile(
                            //   height: 0.09.sh,
                            //   width: 0.18.sw,
                            //   assetPath: Assets.images.cell.path,
                            //   onTap: () {
                            //     logger.i('cell pressed!');

                            //     arController.onLocalObjectAtOriginButtonPressed(
                            //         'Models/animal_cell/cell.gltf');
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 0.03.sw,
                            // ),
                            // ArImageTile(
                            //   height: 0.09.sh,
                            //   width: 0.18.sw,
                            //   assetPath: Assets.images.heart.path,
                            //   onTap: () {
                            //     logger.i('Heart pressed!');

                            //     arController.onLocalObjectAtOriginButtonPressed(
                            //         'Models/heart/heart.gltf');
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 0.03.sw,
                            // ),
                            // ArImageTile(
                            //   height: 0.09.sh,
                            //   width: 0.18.sw,
                            //   assetPath: Assets.images.duck.path,
                            //   onTap: () {
                            //     logger.i('Duck pressed!');

                            //     arController.onLocalObjectAtOriginButtonPressed(
                            //         'Models/duck/Duck.gltf');
                            //     // arController.onWebObjectAtOriginButtonPressed(
                            //     //     "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb");
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
