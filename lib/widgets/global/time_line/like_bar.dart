import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
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
                      ? Icon(FontAwesomeIcons.thumbsUp, size: 25)
                      : Icon(FontAwesomeIcons.solidThumbsUp,
                          color: Colors.blue, size: 25,
                          ),
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
                child: Icon(Iconsax.message, size: 25),
              ),
              const SizedBox(width: 10.0),
              Text(widget.commentCount)
            ]),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(Iconsax.send_2, size: 25),
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
