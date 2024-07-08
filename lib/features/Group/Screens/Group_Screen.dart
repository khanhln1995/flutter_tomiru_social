import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group/Widgets/button_group.dart';
import 'package:tomiru_social_flutter/features/Group/Widgets/header_group.dart';
import 'package:tomiru_social_flutter/features/Group/Widgets/infor_group.dart';
import 'package:tomiru_social_flutter/features/Group/Widgets/members_group.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/action_buttons.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/comment_item.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/post_categories.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/post_item.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/posting_option.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/profile_header.dart';
import 'package:tomiru_social_flutter/features/Profile/Widgets/profile_info.dart';

class GroupScreen extends StatefulWidget {
  final bool isAdmin;
  const GroupScreen({super.key, required this.isAdmin});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  bool isJoined = false;
  void isJoinGroup (bool value) {
    setState(() {
      isJoined = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             HeaderGroup(),
             SizedBox(
               height: 140,
             ),
                ButtonGroup(  isJoined: isJoined, isJoinGroup: isJoinGroup,isAdmin: widget.isAdmin,),
                Divider(
                  thickness: 6,
                  color: Colors.grey[200],
                ),
                if (!isJoined)
                InforGroup(),
                if (!isJoined)
                SizedBox(
                  height: 20,
                ),
                if (!isJoined)
                Divider(
                  thickness: 6,
                  color: Colors.grey[200],
                ),
                if (!isJoined)
                MembersGroup(),
                if (!isJoined)
                  Divider(
                  thickness: 6,
                  color: Colors.grey[200],
                ),
                PostingOptions(),
                Divider(
                  thickness: 6,
                  color: Colors.grey[200],
                ),
                PostCategories(),
                PostItem(),
                CommentItem(
                  avatarUrl: "assets/images/mark-zuckerberg.jpg",
                  userName: "Mark Zuckerberg",
                  comment: "Tư vấn căn hộ giúp mình.",
                  timeAgo: '5 giờ trước',
                )
          ],
        ),
      ),
    );
  }
}