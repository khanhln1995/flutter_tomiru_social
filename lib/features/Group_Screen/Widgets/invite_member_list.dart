import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/member.dart';

class InviteMemberList extends StatelessWidget {
  final List<Member> members;
  final List<bool> invited;
  final Function(int) onInviteToggle;

  InviteMemberList({
    required this.members,
    required this.invited,
    required this.onInviteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: members.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            leading: CircleAvatar(
              backgroundImage: AssetImage(members[index].imageUrl),
            ),
            title: Text(
              members[index].name,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Checkbox(
              value: invited[index],
              onChanged: (bool? value) {
                onInviteToggle(index);
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
