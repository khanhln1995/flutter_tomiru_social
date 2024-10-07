// import 'package:flutter/material.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({super.key});

//   @override
//   _ImagePickerScreenState createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   List<Asset> images = <Asset>[];
//   String _error = 'No Error Dectected';

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> loadAssets() async {
//     List<Asset> resultList = <Asset>[];
//     String error = 'No Error Detected';

//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: const MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }

//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chọn ảnh/ video'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Navigate back with the selected images
//               Navigator.pop(context, images);
//             },
//             child: const Text(
//               'Tiếp',
//               style: TextStyle(color: Colors.white),
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           images.isNotEmpty
//               ? Container(
//                   height: 100.0,
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: images.length,
//                     itemBuilder: (context, index) {
//                       Asset asset = images[index];
//                       return AssetThumb(
//                         asset: asset,
//                         width: 100,
//                         height: 100,
//                       );
//                     },
//                   ),
//                 )
//               : Container(
//                   height: 100.0,
//                   alignment: Alignment.center,
//                   child: const Text(
//                     'Hãy chọn Ảnh/Video',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//           Expanded(
//             child: buildGridView(),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: loadAssets,
//         tooltip: 'Pick Images',
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
