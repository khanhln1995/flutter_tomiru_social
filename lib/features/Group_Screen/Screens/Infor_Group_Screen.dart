import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/members_group_screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/members_group.dart';

class InforGroupScreen extends StatefulWidget {
  final bool isAdmin;
  const InforGroupScreen({super.key, required this.isAdmin});

  @override
  State<InforGroupScreen> createState() => _InforGroupScreenState();
}

class _InforGroupScreenState extends State<InforGroupScreen> {
  final List<String> adminImages = [
    "assets/images/Ellipse 15.png",
    "assets/images/Ellipse 17.png",
    "assets/images/Ellipse 18.png",
    "assets/images/Ellipse 19.png",
  ];

  final List<String> memberImages = [
    "assets/images/Ellipse 15.png",
    "assets/images/Ellipse 17.png",
    "assets/images/Ellipse 18.png",
    "assets/images/Ellipse 19.png",
    "assets/images/Ellipse 22.png",
    "assets/images/Ellipse 24.png",
    "assets/images/Ellipse 25.png",
    "assets/images/Ellipse 24.png",
    "assets/images/Ellipse 25.png",
    "assets/images/Ellipse 24.png",
    "assets/images/Ellipse 25.png",
    "assets/images/Ellipse 25.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Tomiru_Team',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[50],
        body: ListView(
          padding: EdgeInsets.all(17.0),
          children: [
            Text(
              'Giới thiệu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Mô tả giới thiệu về nhóm',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(height: 16),
            _buildSectionTitle('Chủ sở hữu'),
            _buildImageRow([
              'assets/images/Ellipse 25.png'
            ]), // Replace with actual image URLs
            _buildSectionTitle('Quản trị viên'),
            _buildImageRow(adminImages), // Replace with actual image URLs
            SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.public),
              title: Text(
                'Chính sách tham gia',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Công khai',
                  style: TextStyle(
                    fontSize: 12,
                  )),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.visibility),
              title: Text(
                'Hiển thị',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Ai cũng có thể tìm nhóm này',
                  style: TextStyle(
                    fontSize: 12,
                  )),
            ),
            _buildSectionTitle('Thành viên của nhóm (300)'),
            _buildImageGrid(memberImages), // Replace with actual image URLs
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MembersGroupScreen(isAdmin: widget.isAdmin)));
              },
              child: Text(
                "Xem tất cả",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.blue,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[200],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoạt động của nhóm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ActivityItem(
                  icon: Icons.article,
                  title: 'Hôm nay có 14 bài viết mới',
                  subtitle: '304 trong tháng trước',
                ),
                SizedBox(height: 10),
                ActivityItem(
                  icon: Icons.person,
                  title: '300 thành viên',
                  subtitle: '+40 thành viên trong tuần qua',
                ),
                SizedBox(height: 10),
                ActivityItem(
                  icon: Icons.groups,
                  title: 'Tạo 2 năm trước',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildImageRow(List<String> imageUrls) {
    return Row(
      children: imageUrls
          .map((url) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(url),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildImageGrid(List<String> imageUrls) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        // childAspectRatio: 1,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 14.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(imageUrls[index]),
          ),
        );
      },
    );
  }
}
