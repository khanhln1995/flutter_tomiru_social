import 'package:flutter/material.dart';
class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://avatar.iran.liara.run/public/49'),
              ),
              title: Row(
                children: [
                  Text('Nguyen Nhung'),
                  SizedBox(width: 4),
                  Icon(Icons.cabin, color: Colors.orange, size: 16),
                ],
              ),
              subtitle: Row(
                children: [
                  Text('Mua Giới • 2 giờ •'),
                  Icon(Icons.public, size: 14),
                ],
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text('Theo dõi'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Bán gấp Tòa nhà Khách Sạn Cao Cấp 9 tầng, cực đẹp tại trung tâm Quận Hoàn Kiếm. Thông tin chi tiết xin liên hệ...',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Xem thêm")),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset("assets/images/Rectangle 1727.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/Rectangle 1737.png",
                          width: 119.89, height: 107.8),
                      Image.asset("assets/images/Rectangle 1738.png",
                          width: 119.89, height: 107.8),
                      Stack(
                        children: [
                          Image.asset("assets/images/Rectangle 1738.png",
                              width: 119.89, height: 107.8),
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black54,
                              ),
                              // color: Colors.black54,
                              width: 119.89,
                              height: 107.8,
                              child: Center(
                                child: Text(
                                  '+3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Gửi tin nhắn',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      SizedBox(width: 4),
                      Text('20'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.comment_outlined),
                      SizedBox(width: 4),
                      Text('20K'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.share_outlined),
                      SizedBox(width: 4),
                      Text('20K'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}