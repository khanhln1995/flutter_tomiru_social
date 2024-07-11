  import 'package:flutter/material.dart';

class MembersGroupScreen extends StatefulWidget {
  const MembersGroupScreen({super.key});

  @override
  State<MembersGroupScreen> createState() => _MembersGroupScreenState();
}

class _MembersGroupScreenState extends State<MembersGroupScreen> {
   final List<Map<String, String>> admins = [
    {
      'name': 'Anh Cường',
      'friends': '20 Bạn chung',
      'image': 'assets/images/Ellipse 10.png',
    },
    {
      'name': 'Phạm Đình Chương',
      'friends': '12 Bạn chung',
      'image': 'assets/images/Ellipse 10 (1).png',
    },
    {
      'name': 'Bình Cenhomes',
      'friends': '1 Bạn chung',
      'image': 'assets/images/Ellipse 10 (1).png',
    },
  ];

  final List<Map<String, String>> newMembers = [
    {
      'name': 'Lan Anh Cường',
      'friends': '16 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Mạnh Cường',
      'friends': '15 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Anh Cường',
      'friends': '14 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Phạm Đình Chương',
      'friends': '13 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Lan Anh Cường',
      'friends': '16 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Mạnh Cường',
      'friends': '15 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Anh Cường',
      'friends': '14 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
    {
      'name': 'Phạm Đình Chương',
      'friends': '13 Bạn chung',
      'image': 'assets/images/Ellipse 11.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Thành viên',
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
         actions: [
          IconButton(
            icon:Image.asset("assets/images/Group 13258.png"),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.44,vertical: 11),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm thành viên',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 13),
            _buildSectionTitle('Quản trị viên'),
            ...admins.map((admin) => _buildListItem(admin, true)).toList(),
            _buildSectionTitle('Mới vào nhóm'),
            ...newMembers.map((member) => _buildListItem(member, false)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListItem(Map<String, String> item, bool isAdmin) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(item['image']!),
        radius: 28,
      ),
      title: Text(item['name']!),
      subtitle: Text(item['friends']!),
      trailing: Image.asset(isAdmin ? "assets/images/Chat.png" : "assets/images/user-plus 6.png"),
      onTap: () {
        // Handle tap
      },
    );
  }
    
  }
