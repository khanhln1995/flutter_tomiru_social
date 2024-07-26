import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Cập nhật đường dẫn theo dự án của bạn
import "image_gallery_screen.dart";
class Post extends StatelessWidget {
  final Map<String, dynamic> data;

  Post({required this.data});

  void _openImage(BuildContext context, List<String> images, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGalleryScreen(
          images: images,
          initialIndex: index,
        ),
      ),
    );
  }

  Widget _buildImages(List<String> images) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _openImage(context, images, index),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thêm chi tiết bài viết tại đây
          Text(data['content']),
          SizedBox(height: 8.0),
          Container(
            height: 250,
            child: _buildImages(data['images']),
          ),
        ],
      ),
    );
  }
}
