import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/action_buttons.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/comment_item.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/post_categories.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/post_item.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/posting_option.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/profile_header.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Widgets/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(
              height: 120,
            ),
            ActionButtons(),
            Divider(
              thickness: 6,
              color: Colors.grey[200],
            ),
            ProfileInfo(),
            SizedBox(
              height: 20,
            ),
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



// Các widget con khác như PostHeader, PostContent, PostImages, PostActions, PostComments