import 'package:flutter/material.dart';

class ManageMyGroup extends StatefulWidget {
  @override
  _ManageMyGroupState createState() => _ManageMyGroupState();
}

// Chưa hoàn thiện
// Chưa hoàn thiện
// Chưa hoàn thiện


class _ManageMyGroupState extends State<ManageMyGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Loại bỏ bóng đổ
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text("09:41", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HÔM NAY VÀO 14:00",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sự kiện khai trương cửa hàng",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Sự kiện của Tony Nguyen và Tamiru",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text("Quản lý"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text("Sao chép"),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share, size: 28),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "1 người sẽ tham gia",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Nhóm - Thành viên của Tomiru",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bài viết",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Hãy viết gì đó...",
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/avatar.png'), // Thay bằng ảnh đại diện
                    ),
                    title: Text(
                      "Nguyen Nhung đã tạo một sự kiện riêng tư.",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text("2 giờ"),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.grey, // Màu nền mặc định cho CircleAvatar
                    ),
                    title: Text("Tomiru"),
                    subtitle: Text("Sự kiện do Nguyen Nhung tạo"),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                      'assets/images/Firefly.png'), // Thay bằng đường dẫn ảnh của bạn
                  SizedBox(height: 16),
                  Text(
                    "Đang bắt đầu",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sự kiện khai trương",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text("Chia sẻ"),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Tham gia cùng bạn bè",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text("Mời bạn bè"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}