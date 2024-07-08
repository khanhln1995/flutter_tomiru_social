import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group/Screens/Infor_Group_Screen.dart';

class MembersGroup extends StatefulWidget {
  const MembersGroup({super.key});

  @override
  State<MembersGroup> createState() => _MembersGroupState();
}

class _MembersGroupState extends State<MembersGroup> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Thành viên của nhóm (300)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const InforGroupScreen()));
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
            ],
          ),
          const SizedBox(height: 10),
          // Sử dụng một Container có chiều cao cố định
          Container(
            height: 150, // Chiều cao cố định
            child: GridView.builder(
              itemCount: memberImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Số cột trong grid
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 22.0,
              ),
              itemBuilder: (context, index) {
                return CircleAvatar(
                  backgroundImage: AssetImage(memberImages[index]),
                  radius: 30.0,
                );
              },
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
    );
  }
}

class ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  ActivityItem({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
