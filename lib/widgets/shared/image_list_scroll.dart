// import 'package:flutter/material.dart';
// import 'package:science_go/config/app_constants.dart';
// import 'package:science_go/widgets/shared/image_buttoon.dart';

// class ImageGridRow extends StatelessWidget {
//   final List<Image> images;

//   const ImageGridRow({
//     Key? key,
//     required this.images,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: images.map((image) {
//           return ImageButton(
//             onPressed: () => logger.i('Image button pressed!'),
//             image: image,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
