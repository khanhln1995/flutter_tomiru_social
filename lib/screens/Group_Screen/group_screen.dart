import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Group_Screen/widget/button_group.dart';
import 'package:tomiru_social_flutter/screens/Group_Screen/widget/header_group.dart';
import 'package:tomiru_social_flutter/screens/Group_Screen/widget/infor_group.dart';
import 'package:tomiru_social_flutter/screens/Group_Screen/widget/members_group.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/action_buttons.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/comment_item.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/post_categories.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/post_item.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/posting_option.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/profile_header.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/widget/profile_info.dart';

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
                InforGroup(
                  isAdmin: widget.isAdmin,
                ),
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
                MembersGroup( isAdmin: widget.isAdmin),
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