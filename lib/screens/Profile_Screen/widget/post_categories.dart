import 'package:flutter/material.dart';
class PostCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.article, 'label': 'Bài viết'},
    {'icon': Icons.image, 'label': 'Ảnh'},
    {'icon': Icons.event, 'label': 'Sự kiện'},
    {'icon': Icons.play_circle_filled, 'label': 'Short'},
    {'icon': Icons.video_call, 'label': 'Video'},
    {'icon': Icons.poll, 'label': 'Khảo sát'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 32, // Điều chỉnh chiều cao của Container chứa ListView
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategory(
              categories[index]['icon'],
              categories[index]['label'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategory(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: EdgeInsets.symmetric(horizontal: 4), // Khoảng cách giữa các item
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // Tạo khoảng cách giữa các item
        crossAxisAlignment: CrossAxisAlignment.center,
        // Tạo item giữa icon và label
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}