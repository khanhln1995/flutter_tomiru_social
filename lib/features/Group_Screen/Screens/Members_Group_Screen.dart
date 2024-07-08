import 'package:flutter/material.dart';

class MembersGroupScreen extends StatefulWidget {
  final bool isAdmin;
  const MembersGroupScreen({super.key, required this.isAdmin});

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
          if (!widget.isAdmin)
            IconButton(
              icon: Image.asset("assets/images/Group 13258.png"),
              onPressed: () {},
            ),
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.44, vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isAdmin)
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(side: BorderSide.none),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey[100],
                      ),
                      child: Image.asset("assets/images/Group.png"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Chia sẻ nhóm",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm thành viên',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              widget.isAdmin
                  ? _buildSectionTitle('Gợi ý')
                  : _buildSectionTitle('Quản trị viên'),
              Expanded(
                child: ListView.builder(
                  itemCount: admins.length,
                  itemBuilder: (context, index) {
                    final admin = admins[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(admin['image']!),
                        radius: 28,
                      ),
                      title: Text(admin['name']!),
                      subtitle: Text(admin['friends']!),
                      trailing: Image.asset("assets/images/Chat.png"),
                      onTap: () {
                        // Handle tap
                      },
                    );
                  },
                ),
              ),
              _buildSectionTitle('Mới vào nhóm'),
              Expanded(
                child: ListView.builder(
                  itemCount: newMembers.length,
                  itemBuilder: (context, index) {
                    final member = newMembers[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(member['image']!),
                        radius: 28,
                      ),
                      title: Text(member['name']!),
                      subtitle: Text(member['friends']!),
                      trailing: widget.isAdmin
                          ? IconButton(
                              onPressed: () {
                                _showBottomSheet(context, member);
                              },
                              icon: Icon(Icons.more_horiz),
                            )
                          : Image.asset("assets/images/user-plus 6.png"),
                      onTap: () {
                        // Handle tap
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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

 void _showBottomSheet(BuildContext context, Map<String, String> member) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(member['image']!),
                  radius: 28,
                ),
                title: Text(member['name']!),
                subtitle: Text('Đã tham gia từ Tháng 9 năm 2019'),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                leading: Image.asset("assets/images/Group 13324.png"),
                title: Text('Thêm ${member['name']} làm quản trị viên'),
                onTap: () {
                  // Handle add admin
                },
              ),
              ListTile(
                leading:Image.asset("assets/images/Group 13325.png"),
                title: Text('Xem trang cá nhân của ${member['name']}'),
                onTap: () {
                  // Handle view profile
                },
              ),
              ListTile(
                leading:Image.asset("assets/images/Group 13326.png"),
                title: Text('Chặn ${member['name']}'),
                onTap: () {
                  // Handle block
                },
              ),
              ListTile(
                leading:Image.asset("assets/images/Group 13327.png"),
                title: Text('Cấm ${member['name']} đăng'),
                onTap: () {
                  // Handle mute
                },
              ),
              ListTile(
                leading:Image.asset("assets/images/Group 13328.png"),
                title: Text('Xóa ra khỏi nhóm'),
                onTap: () {
                  // Handle remove from group
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
