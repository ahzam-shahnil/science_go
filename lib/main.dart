// import 'dart:io';
// import 'dart:math';

// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
// import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:science_go/bindings/initial_binding.dart';
// import 'package:science_go/theme/app_theme.dart';
// import 'package:vector_math/vector_math_64.dart';

// import 'config/app_constants.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       builder: (context, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: kAppTitle,
//           // navigatorKey: MyApp.navigatorKey,
//           defaultTransition: Transition.native,
//           theme: AppTheme.theme,
//           home: child,
//           initialBinding: InitialBinding(),
//           // builder: EasyLoading.init(),
//         );
//       },
//       child: LocalAndWebObjectsWidget(),
//     );
//   }
// }

// class LocalAndWebObjectsWidget extends StatefulWidget {
//   LocalAndWebObjectsWidget({Key? key}) : super(key: key);
//   @override
//   _LocalAndWebObjectsWidgetState createState() =>
//       _LocalAndWebObjectsWidgetState();
// }

// class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
//   ARSessionManager? arSessionManager;
//   ARObjectManager? arObjectManager;
//   //String localObjectReference;
//   ARNode? localObjectNode;
//   //String webObjectReference;
//   ARNode? webObjectNode;
//   ARNode? fileSystemNode;
//   HttpClient? httpClient;

//   @override
//   void dispose() {
//     super.dispose();
//     arSessionManager!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Local Objects'),
//         ),
//         body: Container(
//             child: Stack(children: [
//           ARView(
//             onARViewCreated: onARViewCreated,
//             planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
//           ),
//           Align(
//               alignment: FractionalOffset.bottomCenter,
//               child:
//                   Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //   children: [
//                 //     ElevatedButton(
//                 //         onPressed: onFileSystemObjectAtOriginButtonPressed,
//                 //         child: Text("Add/Remove Filesystem\nObject at Origin")),
//                 //   ],
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: onLocalObjectAtOriginButtonPressed,
//                         child: Text("Add/Remove Local\nObject at Origin")),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: onLocalObjectShuffleButtonPressed,
//                         child: Text("Shuffle Local\nobject at Origin")),
//                   ],
//                 )
//               ]))
//         ])));
//   }

//   void onARViewCreated(
//       ARSessionManager arSessionManager,
//       ARObjectManager arObjectManager,
//       ARAnchorManager arAnchorManager,
//       ARLocationManager arLocationManager) async {
//     this.arSessionManager = arSessionManager;
//     this.arObjectManager = arObjectManager;

//     this.arSessionManager!.onInitialize(
//           showFeaturePoints: false,
//           showPlanes: true,
//           customPlaneTexturePath: "assets/images/triangle.png",
//           showWorldOrigin: true,
//           handleTaps: false,
//         );
//     this.arObjectManager!.onInitialize();
//     // // Add a gltf model to the ARObjectManager
//     // var gltfModel = await arObjectManager.loadGltfModel(
//     //   'assets/gltf_model.gltf',
//     //   'assets/gltf_model.bin',
//     // );

//     // // Add the gltf model to the scene
//     // arObjectManager.addArObject(gltfModel);
//   }

//   Future<void> onLocalObjectAtOriginButtonPressed() async {
//     if (this.localObjectNode != null) {
//       this.arObjectManager!.removeNode(this.localObjectNode!);
//       this.localObjectNode = null;
//     } else {
//       var newNode = ARNode(
//           type: NodeType.localGLTF2,
//           uri: "Models/scene.gltf",
//           scale: Vector3(0.2, 0.2, 0.2),
//           position: Vector3(0.0, 0.0, 0.0),
//           rotation: Vector4(1.0, 0.0, 0.0, 0.0));
//       try {
//         bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode);
//         this.localObjectNode = (didAddLocalNode!) ? newNode : null;
//       } catch (e) {
//         log.e(e);
//       }
//     }
//   }

//   Future<void> onFileSystemObjectAtOriginButtonPressed() async {
//     if (this.fileSystemNode != null) {
//       this.arObjectManager!.removeNode(this.fileSystemNode!);
//       this.fileSystemNode = null;
//     } else {
//       var newNode = ARNode(
//           type: NodeType.fileSystemAppFolderGLB,
//           uri: "assets/ar_models/DNA.glb",
//           scale: Vector3(0.2, 0.2, 0.2));
//       //Alternative to use type fileSystemAppFolderGLTF2:
//       //var newNode = ARNode(
//       //    type: NodeType.fileSystemAppFolderGLTF2,
//       //    uri: "Chicken_01.gltf",
//       //    scale: Vector3(0.2, 0.2, 0.2));
//       bool? didAddFileSystemNode = await this.arObjectManager!.addNode(newNode);
//       this.fileSystemNode = (didAddFileSystemNode!) ? newNode : null;
//     }
//   }

//   Future<void> onLocalObjectShuffleButtonPressed() async {
//     if (this.localObjectNode != null) {
//       var newScale = Random().nextDouble() / 3;
//       var newTranslationAxis = Random().nextInt(3);
//       var newTranslationAmount = Random().nextDouble() / 3;
//       var newTranslation = Vector3(0, 0, 0);
//       newTranslation[newTranslationAxis] = newTranslationAmount;
//       var newRotationAxisIndex = Random().nextInt(3);
//       var newRotationAmount = Random().nextDouble();
//       var newRotationAxis = Vector3(0, 0, 0);
//       newRotationAxis[newRotationAxisIndex] = 1.0;

//       final newTransform = Matrix4.identity();

//       newTransform.setTranslation(newTranslation);
//       newTransform.rotate(newRotationAxis, newRotationAmount);
//       newTransform.scale(newScale);

//       this.localObjectNode!.transform = newTransform;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: const ModelViewer(
          backgroundColor: Colors.blueAccent,
          src: 'assets/ar_models/test.glb',
          alt: 'A 3D model of an Water Cycle',
          ar: true,
          exposure: 0.4,

          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,

          // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: false,
        ),
      ),
    );
  }
}
