import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/enum.dart';
import 'member.dart';

class TabBarSection extends StatelessWidget {
  final List<Member> members;
  TabBarSection({required this.members});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: TabBar(
                // isScrollable: true,
                tabs: [
                  Tab(text: 'Tất cả'),
                  Tab(text: 'Quản trị viên'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        return MemberWidget(member: members[index], membersInGroup: members);
                      },
                    ),
                    ListView.builder(
                      itemCount: members.where((e) => e.role.userRoleInGroup == UserRoleInGroup.ADMIN).length,
                      itemBuilder: (context, index) {
                        var admins = members.where((e) => e.role.userRoleInGroup == UserRoleInGroup.ADMIN).toList();
                        return MemberWidget(member: admins[index], membersInGroup: admins);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}