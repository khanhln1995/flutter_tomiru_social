import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/member.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/tab_bar.dart';
import 'package:tomiru_social_flutter/helper/enum.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';


class GroupMembersWidget extends StatefulWidget {
  const GroupMembersWidget({Key? key});

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
        imageUrl: 'assets/images/member2.png',
        isOnline: false),
    Member(
        id: 3,
        name: "Ánh Nguyệt",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "14 phút trước",
        imageUrl: 'assets/images/member3.png',
        isOnline: true),
    Member(
        id: 4,
        name: "C Hoa S3",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "",
        imageUrl: 'assets/images/member4.png',
        isOnline: false),
    Member(
        id: 5,
        name: "Bnd",
        role: MemberRole(userRoleInGroup: UserRoleInGroup.MEMBER),
        lastSeen: "",
        imageUrl: 'assets/images/member5.png',
        isOnline: true),
  ];

  Widget _body(BuildContext context) {
    return Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text('Gợi ý thêm thành viên'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
              ],
            ),
          ),
          TabBarSection(members: members),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: members.length,
          //     itemBuilder: (context, index) {
          //       return MemberWidget(member: members[index]);
          //     },
          //   ),
          // ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
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