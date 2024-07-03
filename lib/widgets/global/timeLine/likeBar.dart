import 'package:flutter/material.dart';

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
        SizedBox(
          height: 5.0,
        ),
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
                      ? Icon(Icons.thumb_up_alt_outlined, size: 24)
                      : Icon(Icons.thumb_up_alt_rounded,
                          color: Colors.blue, size: 24),
                ),
                SizedBox(width: 10),
                Text(widget.likeCount),
              ],
            ),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.messenger_outline, size: 24),
              ),
              SizedBox(width: 10.0),
              Text(widget.commentCount)
            ]),
            Row(children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.reply_outlined,
                  size: 24,
                ),
              ),
              SizedBox(width: 10.0),
              Text(widget.shareCount)
            ]),
          ],
        ),
      ],
    );
  }
}
