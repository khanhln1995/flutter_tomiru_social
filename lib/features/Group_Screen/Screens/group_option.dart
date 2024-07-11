import 'package:flutter/material.dart';

import 'package:tomiru_social_flutter/features/Group_Screen/Screens/group_members.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/add_member.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';

class GroupOption extends StatefulWidget {
  final bool isAdmin;
  const GroupOption({Key? key, required this.isAdmin}) : super(key: key);

  @override
  State<GroupOption> createState() => _GroupOptionState();
}

class _GroupOptionState extends State<GroupOption> {
  final List<String> imageUrls = [
    'assets/images/Rectangle 1884.png',
    'assets/images/Rectangle 1885.png',
    'assets/images/Rectangle 1886.png',
    'assets/images/Rectangle 1887.png',
  ];
  bool isPrivate = false;
  bool hasPassword = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/Avatar 5.png', // Ensure the image path is correct
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
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nhóm BĐS Vinhomes',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 22.0,
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 16.0, // Size of the icon inside
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  optionInAGroup(context, 'Tìm tin nhắn', Icon(Icons.search)),
                  optionInAGroup(
                      context, 'Thêm thành viên', Icon(Icons.person_add), () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Addmember(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }),
                  optionInAGroup(
                      context, 'Gọi theo nhóm', Icon(Icons.video_call)),
                  optionInAGroup(
                      context, 'Tắt thông báo', Icon(Icons.notifications_none)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 8, color: Colors.grey[200]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kho lưu trữ (25)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Xem ảnh, link, file đã chia sẻ',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 17.0),
                                child: Image.asset(
                                  imageUrls[index],
                                  width: 55.5,
                                  height: 56,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 83.0,
                        height: 55.0,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 24.0, // Size of the icon inside
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.grey[200]),
            Column(
              children: [
                ListTile(
                  title: Text('Lịch nhóm',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                ListTile(
                  title: Text('Thành viên (6)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            GroupMembersWidget(
                              isAdmin: widget.isAdmin,
                            ),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                ListTile(
                  title: Text('Chế độ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: Text('Riêng tư',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Bật chế độ riêng tư sẽ cài đặt nhóm trở thành Nhóm bí mật, người dùng sẽ không thể tìm thấy nhóm chat này qua: Tìm kiếm, Tìm quanh đây,...'),
                  trailing: Switch(
                    value: isPrivate,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.blue[100],
                    onChanged: (bool value) {
                      setState(() {
                        isPrivate = value;
                      });
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                ListTile(
                  title: Text('Mật khẩu nhóm',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  trailing: Switch(
                    value: hasPassword,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.blue[100],
                    onChanged: (bool value) {
                      setState(() {
                        hasPassword = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(thickness: 8, color: Colors.grey[200]),
            ListTile(
              title: Text('Link tham gia nhóm',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text(
                'https://Cenchat/dedebwh016',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 13,
                    color: Colors.blue),
              ),
              trailing: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/Group 11410.png"),
                      fit: BoxFit.cover,
                    ),
                  )),
              onTap: () {},
            ),
            ListTile(
              title: Text('Báo xấu',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Xóa lịch sử trò chuyện',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Rời nhóm',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            SizedBox(height: 50.0),
          ],
        ),
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
            customBorder: CircleBorder(),
            onTap: onTap ?? () {},
            splashColor: Colors.red,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          newWord,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
