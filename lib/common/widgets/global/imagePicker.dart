import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/customAppBar.dart';

class GalleryImage extends StatefulWidget {
  const GalleryImage({super.key});

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _body(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        titleText: 'Chọn ảnh/ video',
        onBackPress: () => Navigator.of(context).pop(),
        bgcolor: Colors.grey[100],
        colors: Colors.black,
        icon: Icons.close,
        widget: [TextButton(onPressed: () {}, child: const Text('Tiếp'))],
      ),
      body: _body(context),
    );
  }
}

