import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/approve_group_screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/member.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/tab_bar.dart';
import 'package:tomiru_social_flutter/helper/enum.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';

class GroupMembersWidget extends StatefulWidget {
  final bool isAdmin;
  const GroupMembersWidget({Key? key, required this.isAdmin}) : super(key: key);

  @override
  State<GroupMembersWidget> createState() => _GroupMembersWidgetState();
}

class _GroupMembersWidgetState extends State<GroupMembersWidget> {
  List<Member> members = [
    Member(
        id: 1,
        name: "CEN ThaiTV",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.ADMIN),
        lastSeen: "2 phút trước",
        imageUrl: 'assets/images/icon-tomiru.png',
        isOnline: true),
    Member(
        id: 2,
        name: "Bích Thùy",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "",
        imageUrl: 'assets/images/Ellipse 19.png',
        isOnline: false),
    Member(
        id: 3,
        name: "Ánh Nguyệt",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "14 phút trước",
        imageUrl: 'assets/images/Ellipse 19.png',
        isOnline: true),
    Member(
        id: 4,
        name: "C Hoa S3",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "",
        imageUrl: 'assets/images/Ellipse 19.png',
        isOnline: false),
    Member(
        id: 5,
        name: "Bnd",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "",
        imageUrl: 'assets/images/Ellipse 19.png',
        isOnline: true),
  ];

  Widget _body(BuildContext context) {
    return Column(
      children: [
        if (!widget.isAdmin)
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text('Gợi ý thêm thành viên'),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
              ],
            ),
          ),
        if (widget.isAdmin)
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Thành viên chờ phê duyệt (4)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder:(context)=> const ApproveGroupScreen() )
                        );
                      },
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 142,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2, // Hoặc số lượng thành viên cần hiển thị
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 280,
                          height: 142,
                          child: const MemberCard(
                            name: "Hồng Anh Vũ",
                            role: "Môi giới",
                            time: "2 phút trước",
                            invitedBy: "Được mời bởi Hồng An",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        TabBarSection(members: members),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Thành viên',
        onBackPress: () => Navigator.of(context).pop(),
        bgcolor: Colors.white,
        colors: Colors.black,
      ),
      body: _body(context),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String time;
  final String invitedBy;

  const MemberCard(
      {required this.name,
      required this.role,
      required this.time,
      required this.invitedBy});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey[300]!, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 23.5,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(
                      '$role • $time',
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      invitedBy,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  height: 30,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Từ chối',
                          style: TextStyle(color: Colors.black, fontSize: 13)),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    width: 110,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Chấp nhận',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
