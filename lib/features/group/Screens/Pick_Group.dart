import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Screens/Create_Event.dart';

class PickGroup extends StatefulWidget {
  const PickGroup({super.key});
  @override
  _PickGroupState createState() => _PickGroupState();
}

class _PickGroupState extends State<PickGroup> {
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Hội Saler Sun Tower',
      'imagePath': 'assets/images/icon-tomiru-appbar.jpg'
    },
    {
      'name': 'Anh em Saler quận Ba Đình',
      'imagePath': 'assets/images/icon-tomiru-appbar.jpg'
    },
    {
      'name': 'Hội Căn lô góc VinCity',
      'imagePath': 'assets/images/icon-tomiru-appbar.jpg'
    },
    {'name': 'Hội Hè', 'imagePath': 'assets/images/icon-tomiru-appbar.jpg'},
    {
      'name': 'Thiên Địa hội',
      'imagePath': 'assets/images/icon-tomiru-appbar.jpg'
    },
  ];

  final Map<String, dynamic> managedGroup = {
    'name': 'Tomiru',
    'imagePath': 'assets/images/icon-tomiru-appbar.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Expanded(
              child: Center(
                // Sử dụng Center để căn giữa "Nhóm"
                child: Text("Chọn nhóm"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 10.0), // Khoảng cách 20px từ "Hủy" tới cạnh phải
              child: Text(
                "Hủy",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm tên',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          GestureDetector(
              child: _buildGroupSection('Nhóm bạn quản lý', [managedGroup]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateEventPage()));
              }),
          GestureDetector(
            child: _buildGroupSection('Nhóm bạn tham gia', groups),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateEventPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGroupSection(String title, List<Map<String, dynamic>> groups) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          // Sử dụng Wrap để bọc các item ListTile
          runSpacing: 15, // Khoảng cách giữa các item theo chiều dọc
          children: groups.map((group) => _buildGroupItem(group)).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildGroupItem(Map<String, dynamic> group) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      leading: Container(
        // Sử dụng Container thay vì SizedBox
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Đặt hình dạng là hình chữ nhật
          borderRadius:
              BorderRadius.zero, // Bo tròn các góc về 0 để tạo hình vuông
          image: DecorationImage(
            image: AssetImage(group['imagePath']),
            fit: BoxFit
                .cover, // Điều chỉnh cách ảnh được hiển thị trong Container
          ),
        ),
      ),
      title: Text(group['name']),
    );
  }
}
// ! backgroundImage: AssetImage(group['imagePath'])
// ! Text(group['name'])