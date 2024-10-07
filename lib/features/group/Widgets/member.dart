import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/enum.dart';
import 'package:tomiru_social_flutter/common/widgets/friends2_widget/friends_button.dart';
import 'package:tomiru_social_flutter/common/widgets/friends2_widget/friends_button.dart';
import "package:tomiru_social_flutter/features/Friends/Widgets/Info_Friend_Bottom_Sheet.dart";
import "package:tomiru_social_flutter/features/Friends/Widgets/Open_Bottom_Sheet.dart";
extension RoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.INVESTOR:
        return 'Chủ đầu tư';
      case UserRole.CUSTOMER:
        return 'Khách hàng';
      case UserRole.SALER:
        return 'Sale BDS Vip';
      default:
        return '';
    }
  }
}

extension RoleInGroupExtension on UserRoleInGroup {
  String get displayName {
    switch (this) {
      case UserRoleInGroup.ADMIN:
        return 'Người tạo nhóm';
      case UserRoleInGroup.MEMBER:
        return 'Do bạn thêm';
      default:
        return '';
    }
  }
}

class MemberRole {
  final UserRole? userRole;
  final UserRoleInGroup? userRoleInGroup;

  MemberRole({this.userRole, this.userRoleInGroup});

  String get displayName {
    if (userRole != null) {
      return userRole!.displayName;
    } else if (userRoleInGroup != null) {
      return userRoleInGroup!.displayName;
    } else {
      return '';
    }
  }
}

class Member {
  final int id;
  final String name;
  final MemberRole role;
  final String lastSeen;
  final String imageUrl;
  bool isSelected;
  bool isOnline;
  Member({
    required this.id,
    required this.name,
    required this.role,
    required this.lastSeen,
    required this.imageUrl,
    required this.isOnline,
    this.isSelected = false,
  });
}

class MemberWidget extends StatefulWidget {
  final Member member;
  final bool isAdding;
  final List<Member> addingMem;
  final List<Member> membersInGroup;
  final Function(int)? chosenMember;
  MemberWidget(
      {required this.member,
      this.chosenMember = _defaultChosenMember,
      this.addingMem = const [],
      this.membersInGroup = const [],
      this.isAdding = false});

  static void _defaultChosenMember(int id) {}
  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  void _showRemoveDialog(BuildContext context, String memberName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Center(
            child: Column(
              children: [
                Text(
                  'Mời ra khỏi nhóm?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '$memberName sẽ không thể chat và truy cập bảng tin nhóm!',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text('Xác nhận'),
              onPressed: () {
                // Add your remove member logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.member.imageUrl),
          ),
          if (widget.member.isOnline)
            Positioned(
              bottom: -1,
              right: -1,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
        ],
      ),
      title: Text(widget.member.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0)),
      subtitle: Row(children: [
        Text(widget.member.role.displayName, style: TextStyle(fontSize: 13.0)),
        if (widget.member.lastSeen.isNotEmpty && widget.isAdding)
          Text(' - ${widget.member.lastSeen}',
              style: TextStyle(fontSize: 13.0)),
      ]),
      trailing: Transform.scale(
          scale: 1.2,
          child: (widget.isAdding)
              ? Radio<bool>(
                  activeColor: Colors.orange,
                  value: widget.member.isSelected,
                  groupValue: !widget.addingMem.contains(widget.member),
                  toggleable: true,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.member.isSelected = value ?? false;
                      widget.chosenMember!(widget.member.id);
                    });
                  },
                )
              : SizedBox()),
      onTap: () {
        if (widget.isAdding) {
          widget.chosenMember!(widget.member.id);
        } else {
          List<Map<String, String>> membersInGroupAsMap = widget.membersInGroup.map((member) {
            return {
              'avatarImage': member.imageUrl,
              'friendName': member.name,
            };
          }).toList();
          OpenBottomSheet(
            context,
            InfoFriend(
              listName: membersInGroupAsMap,
              index: widget.membersInGroup.indexOf(widget.member),
              avatarImage: 'avatarImage',
              friendName: 'friendName',
            ),
            Column(
              children: [
                CustomButton(
                  icon: Icons.message,
                  text: "Nhắn tin",
                ),
                GestureDetector(
                  onTap: (){
                    _showRemoveDialog(context, widget.member.name);
                  },
                  child: CustomButton(
                    icon: Icons.person_remove,
                    text: "Xóa khỏi nhóm",
                    
                  ),
                ),
                CustomButton(
                  icon: Icons.block,
                  text: "Chặn",
                ),
                CustomButton(
                  icon: Icons.person_off,
                  text: "Hủy kết bạn",
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
