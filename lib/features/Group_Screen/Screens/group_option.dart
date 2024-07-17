import 'package:flutter/material.dart';

import 'package:tomiru_social_flutter/features/Group_Screen/Screens/group_members.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/add_member.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';

class GroupOption extends StatefulWidget {
  const GroupOption({Key? key}) : super(key: key);

  @override
  State<GroupOption> createState() => _GroupOptionState();
}

class _GroupOptionState extends State<GroupOption> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        titleText: 'Tuỳ chọn',
        onBackPress: () => Navigator.of(context).pop(),
        bgcolor: Colors.white,
        colors: Colors.black,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/Avatar 5.png', // Đảm bảo đường dẫn đến ảnh đúng
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: -5,
                      bottom: 0,
                      child: Image.asset("assets/images/Group 10036.png"),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Nhóm BĐS Vinhomes',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.edit, color: Colors.grey[200]),
                  ],

                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                optionInAGroup(context, 'Tìm tin nhắn', const Icon(Icons.search)),
                optionInAGroup(
                    context, 'Thêm thành viên', const Icon(Icons.person_add), () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                         const GroupMembersWidget(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                }),
                optionInAGroup(context, 'Gọi theo nhóm', const Icon(Icons.video_call)),
                optionInAGroup(context, 'Tắt thông báo',
                    const Icon(Icons.notifications_none)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[200]),
          ListTile(
            title: const Text('Kho lưu trữ (25)'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://maisonoffice.vn/wp-content/uploads/2023/05/bat-dong-san-thuong-mai-1.jpg',
                    width: 100,
                    height: 100,
                  ),
                );
              }),
            ),
          ),
          ListTile(
            title: const Text('Lịch nhóm'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Thành viên (6)'),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const GroupMembersWidget(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Riêng tư'),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: const Text('Mật khẩu nhóm'),
            value: false,
            onChanged: (bool value) {},
          ),
          Divider(color: Colors.grey[200]),
          ListTile(
            title: const Text('Link tham gia nhóm'),
            subtitle: const Text(
              'https://Cenchat/dedebwh016',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            trailing: const Icon(Icons.link),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Báo xấu'),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Xóa lịch sử trò chuyện',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Rời nhóm',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Widget optionInAGroup(BuildContext context, String title, Icon icon,
      [Function()? onTap]) {
    var words = title.split(" ");
    words.insert(1, '\n');
    var newWord = words.join(" ");
    return Column(
      children: [
        ClipOval(
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap ?? () {},
            splashColor: Colors.red,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          newWord,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
