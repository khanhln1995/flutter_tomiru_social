import 'package:flutter/material.dart';
import "load_comment_widget.dart";
import 'package:tomiru_social_flutter/util/show_post_comments.dart';

class LikeBar extends StatefulWidget {
  final String likeCount;
  final String shareCount;
  final String commentCount;
  LikeBar(
      {required this.likeCount,
      required this.commentCount,
      required this.shareCount});
  var isLikeActive = false;
  @override
  State<LikeBar> createState() => _LikeBarState();
}

class _LikeBarState extends State<LikeBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.isLikeActive = !widget.isLikeActive;
                    });
                  },
                  child: widget.isLikeActive
                      ? Icon(Icons.thumb_up_alt_outlined, size: 25)
                      : Icon(Icons.thumb_up_alt_rounded,
                          color: Colors.blue, size: 28),
                ),
                const SizedBox(width: 10),
                Text(widget.likeCount),
              ],
            ),
            Row(children: [
              InkWell(
                onTap: () {
                  showUnderBottomSheet(context, 0);
                },
                child: Icon(Icons.messenger_outline, size: 25),
              ),
              const SizedBox(width: 10.0),
              Text(widget.commentCount)
            ]),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.share, size: 25),
              ),
              const SizedBox(width: 10.0),
              Text(widget.shareCount)
            ]),
          ],
        ),
      ],
    );
  }
}
