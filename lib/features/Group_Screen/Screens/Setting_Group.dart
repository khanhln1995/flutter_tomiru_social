import 'package:flutter/material.dart';
import "package:tomiru_social_flutter/features/group_screen/screens/Manage_My_Group.dart";
import 'package:tomiru_social_flutter/features/group_screen/screens/setting_components/Following.dart';
import 'package:tomiru_social_flutter/features/group_screen/screens/setting_components/Group_Notification.dart';
import 'package:tomiru_social_flutter/features/group_screen/screens/setting_components/Invitation.dart';
import 'package:tomiru_social_flutter/features/group_screen/screens/setting_components/Member_List.dart';
import 'package:tomiru_social_flutter/features/group_screen/screens/setting_components/Pinned_Group.dart';

class SettingGroup extends StatefulWidget {
  const SettingGroup({super.key});

  @override
  _SettingGroupState createState() => _SettingGroupState();
}

class _SettingGroupState extends State<SettingGroup> {
  final paddingTextInTextField = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: const Text("Cài đặt nhóm", style:TextStyle(fontWeight: FontWeight.bold)),
              
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
            //Recent Group Activities Section
            Column(
              children: List.generate(5, (index) {
                final List<String> titles = [
                  'Thông báo',
                  'Ghim',
                  'Đang theo dõi',
                  'Thành viên',
                  'Lời mời',
                ];
                
                final List<String> subtitles = [
                  'Chỉnh sửa tùy chọn nhận thông báo',
                  'Ghim các nhóm bạn yêu thích để truy cập nhanh',
                  'Theo dõi hoặc bỏ theo dõi để kiểm soát những gì bạn nhìn thấy trên Bảng tin',
                  'Rời khỏi các nhóm mà bạn không quan tâm',
                  'Gửi, chấp nhận và quản lý lời mời tham gia nhóm',
                ];
                return Container(
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    leading: const SizedBox(
                     
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mark-zuckerberg.jpg'),
                            radius: 27,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: (){
                        if (titles[index] == 'Ghim') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PinnedGroup()));
                        }
                         if (titles[index] == 'Đang theo dõi') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Following()));
                        }
                         if (titles[index] == 'Thành viên') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  MemberList()));
                        }
                        if (titles[index] == 'Thông báo') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  GroupNotification()));
                        }
                         if (titles[index] == 'Lời mời') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       Invitation()));
                        }
                      },
                      child: Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle:  Text(subtitles[index], softWrap: true,
                      style: const TextStyle(
                        fontSize: 12,
                        
                      ),
                    ),
                  ),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}
