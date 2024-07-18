import 'package:flutter/material.dart';

class PostWidge extends StatelessWidget {
  const PostWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual profile image path
            ),
            title: Text('Nguyen Nhung'),
            subtitle: Text('2 giờ trước'),
            trailing: Text('Theo dõi'),
          ),
          Text(
            'Bán gấp Tòa nhà Khách Sạn Cao Cấp 9 tầng, cực đẹp tại trung tâm Quận Hoàn Kiếm. Thông tin chi tiết xin liên hệ... Xem thêm',
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/photo${index + 1}.jpg'), // Replace with actual image paths
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.thumb_up_alt_outlined),
              Icon(Icons.comment_outlined),
              Icon(Icons.share_outlined),
            ],
          ),
        ],
      ),
    );
  }
}