import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/comment_bottom_sheet.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/sharing_post.dart';

Widget getPage(int index) {
  switch (index) {
    case 0:
      return const CommentArea();
    case 1:
      return const SharePostSheet();
    default:
      return const CommentArea();
  }
}

void showUnderBottomSheet(BuildContext context, int index) {
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
          child: getPage(index),
        ),
      );
    },
  );
}
