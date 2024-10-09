import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/comment_bottom_sheet.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/sharing_post.dart';

Widget getPage(int index, int id) {
  switch (index) {
    case 0:
      return CommentArea(tweetId: id);
    case 1:
      return const SharePostSheet();
    default:
      return CommentArea(tweetId: id);
  }
}

void showUnderBottomSheet(BuildContext context, int index, int id) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: getPage(index, id),
        ),
      );
    },
  );
}
