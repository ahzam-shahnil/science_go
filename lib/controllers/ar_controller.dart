// ignore_for_file: unnecessary_cast

import 'dart:io';

import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:get/get.dart';
import 'package:science_go/config/app_constants.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArController extends GetxController {
  static ArController instance = Get.find();
  var isArButtonShown = false.obs;
  var arSessionManager = (null as ARSessionManager?).obs;
  var arObjectManager = (null as ARObjectManager?).obs;
  var arAnchorManager = (null as ARAnchorManager?).obs;
  //String localObjectReference;
  var localObjectNode = (null as ARNode?).obs;
  //String webObjectReference;

  var nodes = <ARNode>[].obs;
  var anchors = <ARAnchor>[].obs;
  var webObjectNode = (null as ARNode?).obs;
  var fileSystemNode = (null as ARNode?).obs;

  HttpClient? httpClient;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  toggleArBtn() {
    isArButtonShown.value = !isArButtonShown.value;
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) async {
    this.arSessionManager.value = arSessionManager;
    this.arObjectManager.value = arObjectManager;
    this.arAnchorManager.value = arAnchorManager;

    this.arSessionManager.value?.onInitialize(
          showFeaturePoints: false,
          showPlanes: false,
          customPlaneTexturePath: "assets/images/triangle.png",
          showWorldOrigin: false,
          showAnimatedGuide: false,
          handlePans: true,
          handleRotation: true,
          // handleTaps: false,
        );
    this.arObjectManager.value?.onInitialize();

    // this.arSessionManager.value?.onPlaneOrPointTap = onPlaneOrPointTapped;
    // this.arObjectManager.value?.onNodeTap = onNodeTapped;
    // //Download model to file system
    // httpClient = new HttpClient();
    // _downloadFile(
    //     "https://github.com/ahzam-shahnil/science_go/raw/da3eb46c0fd9c7234c9c07053c16097c9de06b08/assets/ar_models/scene.glb",
    //     "LocalDuck.glb");
    // // Add a gltf model to the ARObjectManager
    // var gltfModel = await arObjectManager.loadGltfModel(
    //   'assets/gltf_model.gltf',
    //   'assets/gltf_model.bin',
    // );

    // // Add the gltf model to the scene
    // arObjectManager.addArObject(gltfModel);
  }

  // Future<File> _downloadFile(String url, String filename) async {
  //   var request = await httpClient!.getUrl(Uri.parse(url));
  //   var response = await request.close();
  //   var bytes = await consolidateHttpClientResponseBytes(response);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file = new File('$dir/$filename');
  //   await file.writeAsBytes(bytes);
  //   logger.i("Downloading finished, path: " + '$dir/$filename');
  //   return file;
  // }

  // Future<void> _downloadAndUnpack(String url, String filename) async {
  //   var request = await httpClient!.getUrl(Uri.parse(url));
  //   var response = await request.close();
  //   var bytes = await consolidateHttpClientResponseBytes(response);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file = new File('$dir/$filename');
  //   await file.writeAsBytes(bytes);
  //   print("Downloading finished, path: " + '$dir/$filename');

  //   // To print all files in the directory: print(Directory(dir).listSync());
  //   try {
  //     await ZipFile.extractToDirectory(
  //         zipFile: File('$dir/$filename'), destinationDir: Directory(dir));
  //     print("Unzipping successful");
  //   } catch (e) {
  //     print("Unzipping failed: " + e.toString());
  //   }
  // }

  Future<void> onWebObjectAtOriginButtonPressed(String assetUri) async {
    if (this.webObjectNode.value != null) {
      this.arObjectManager.value?.removeNode(this.webObjectNode.value!);
      this.webObjectNode.value = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri: assetUri,
          // "https://github.com/ahzam-shahnil/science_go/raw/da3eb46c0fd9c7234c9c07053c16097c9de06b08/assets/ar_models/scene.glb",
          scale: vector.Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await this.arObjectManager.value?.addNode(newNode);
      this.webObjectNode.value = (didAddWebNode!) ? newNode : null;
    }
  }

  Future<void> onLocalObjectAtOriginButtonPressed(String assetUri) async {
    if (localObjectNode.value != null) {
      arObjectManager.value?.removeNode(localObjectNode.value!);
      localObjectNode.value = null;
    }
    var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: assetUri,
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, 0.0),
        rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0));
    try {
      bool? didAddLocalNode = await arObjectManager.value?.addNode(newNode);
      if (didAddLocalNode != null) {
        localObjectNode.value = (didAddLocalNode) ? newNode : null;
      } else {
        localObjectNode.value = null;
      }
      toggleArBtn();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    anchors.forEach((anchor) {
      this.arAnchorManager.value?.removeAnchor(anchor);
    });
    anchors.value = <ARAnchor>[];
  }

  Future<void> onNodeTapped(List<String> nodes) async {
    var number = nodes.length;
    this.arSessionManager.value?.onError("Tapped $number node(s)");
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
        (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    var newAnchor =
        ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
    bool? didAddAnchor = await this.arAnchorManager.value?.addAnchor(newAnchor);
    if (didAddAnchor != null && didAddAnchor) {
      this.anchors.add(newAnchor);
      // Add note to anchor
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
              "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
          scale: vector.Vector3(0.2, 0.2, 0.2),
          position: vector.Vector3(0.0, 0.0, 0.0),
          rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddNodeToAnchor = await this
          .arObjectManager
          .value
          ?.addNode(newNode, planeAnchor: newAnchor);
      if (didAddNodeToAnchor != null && didAddNodeToAnchor) {
        this.nodes.add(newNode);
      } else {
        this.arSessionManager.value?.onError("Adding Node to Anchor failed");
      }
    } else {
      this.arSessionManager.value?.onError("Adding Anchor failed");
    }
    /*
    // To add a node to the tapped position without creating an anchor, use the following code (Please mind: the function onRemoveEverything has to be adapted accordingly!):
    var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: "Models/Chicken_01/Chicken_01.gltf",
        scale: Vector3(0.2, 0.2, 0.2),
        transformation: singleHitTestResult.worldTransform);
    bool didAddWebNode = await this.arObjectManager.addNode(newNode);
    if (didAddWebNode) {
      this.nodes.add(newNode);
    }*/
  }
  // Future<void> onLocalObjectShuffleButtonPressed() async {
  //   var newScale = Random().nextDouble() / 3;
  //   var newTranslationAxis = Random().nextInt(3);
  //   var newTranslationAmount = Random().nextDouble() / 3;
  //   var newTranslation = vector.Vector3(0, 0, 0);
  //   newTranslation[newTranslationAxis] = newTranslationAmount;
  //   var newRotationAxisIndex = Random().nextInt(3);
  //   var newRotationAmount = Random().nextDouble();
  //   var newRotationAxis = vector.Vector3(0, 0, 0);
  //   newRotationAxis[newRotationAxisIndex] = 1.0;

  //   final newTransform = Matrix4.identity();

  //   newTransform.setTranslation(newTranslation);
  //   newTransform.rotate(newRotationAxis, newRotationAmount);
  //   newTransform.scale(newScale);

  //   localObjectNode.value?.transform = newTransform;
  // }

  @override
  void onClose() {
    arSessionManager.value?.dispose();
    super.onClose();
  }
}
