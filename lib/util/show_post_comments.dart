import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/comment_bottom_sheet.dart';

void showCommentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 300),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: CommentArea(),
        ),
      );
    },
  );
}