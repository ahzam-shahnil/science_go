/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsArModelsGen {
  const $AssetsArModelsGen();

  $AssetsArModelsWaterCycleAudioGen get waterCycleAudio =>
      const $AssetsArModelsWaterCycleAudioGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLogosGen get logos => const $AssetsImagesLogosGen();

  /// File path: assets/images/triangle.png
  AssetGenImage get triangle =>
      const AssetGenImage('assets/images/triangle.png');

  /// List of all assets
  List<AssetGenImage> get values => [triangle];
}

class $AssetsArModelsWaterCycleAudioGen {
  const $AssetsArModelsWaterCycleAudioGen();

  /// File path: assets/ar_models/water_cycle_audio/Collection.m4a
  String get collection => 'assets/ar_models/water_cycle_audio/Collection.m4a';

  /// File path: assets/ar_models/water_cycle_audio/Condensation.m4a
  String get condensation =>
      'assets/ar_models/water_cycle_audio/Condensation.m4a';

  /// File path: assets/ar_models/water_cycle_audio/Evaporation.m4a
  String get evaporation =>
      'assets/ar_models/water_cycle_audio/Evaporation.m4a';

  /// File path: assets/ar_models/water_cycle_audio/Introduction Water cycle.m4a
  String get introductionWaterCycle =>
      'assets/ar_models/water_cycle_audio/Introduction Water cycle.m4a';

  /// File path: assets/ar_models/water_cycle_audio/Precipitation.m4a
  String get precipitation =>
      'assets/ar_models/water_cycle_audio/Precipitation.m4a';

  /// List of all assets
  List<String> get values => [
        collection,
        condensation,
        evaporation,
        introductionWaterCycle,
        precipitation
      ];
}

class $AssetsImagesLogosGen {
  const $AssetsImagesLogosGen();

  /// File path: assets/images/logos/cover_logo.jpeg
  AssetGenImage get coverLogo =>
      const AssetGenImage('assets/images/logos/cover_logo.png');

  /// File path: assets/images/logos/logo_dark.jpeg
  AssetGenImage get logoDark =>
      const AssetGenImage('assets/images/logos/logo_dark.jpeg');

  /// File path: assets/images/logos/logo_light.jpeg
  AssetGenImage get logoLight =>
      const AssetGenImage('assets/images/logos/logo_light.jpeg');

  /// File path: assets/images/logos/name_logo.jpeg
  AssetGenImage get nameLogo =>
      const AssetGenImage('assets/images/logos/name_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [coverLogo, logoDark, logoLight, nameLogo];
}

class Assets {
  Assets._();

  static const $AssetsArModelsGen arModels = $AssetsArModelsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
