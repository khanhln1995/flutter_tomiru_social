import 'package:flutter/material.dart';

class SettingGroup extends StatefulWidget {
  const SettingGroup({super.key});

  @override
  State<SettingGroup> createState() => _SettingGroupState();
}

class _SettingGroupState extends State<SettingGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 27,
          ),
        ),
        title: const Text('Cài đặt nhóm',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        )
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildListItem(
            context,
            icon: Icons.notifications,
            title: 'Thông báo',
            subtitle: 'Chỉnh sửa tuỳ chọn nhận thông báo',
          ),
          _buildListItem(
            context,
            icon: Icons.push_pin,
            title: 'Ghim',
            subtitle: 'Ghim các nhóm bạn yêu thích để truy cập nhanh.',
          ),
          _buildListItem(
            context,
            icon: Icons.follow_the_signs,
            title: 'Đang theo dõi',
            subtitle: 'Theo dõi hoặc bỏ theo dõi nhóm để kiểm soát những gì bạn nhìn thấy trên Bảng tin.',
          ),
          _buildListItem(
            context,
            icon: Icons.group,
            title: 'Thành viên',
            subtitle: 'Rời khỏi các nhóm mà bạn không quan tâm nữa.',
          ),
          _buildListItem(
            context,
            icon: Icons.mail_outline,
            title: 'Lời mời',
            subtitle: 'Gửi, chấp nhận và quản lý lời mời tham gia nhóm.',
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(icon, color: Colors.grey[600]),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[700],
        ),
      ),
      onTap: () {
        // Handle item tap
      },
    );
  }
}