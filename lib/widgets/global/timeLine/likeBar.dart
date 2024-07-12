import 'package:flutter/material.dart';
import "../../time_line/load_comment_widget.dart";
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
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.95,
                        padding: EdgeInsets.all(16.0),
                        child: LoadCommentWidget(
                          data: {
                            'userName': 'John Doe',
                            'avatar': 'https://avatar.iran.liara.run/public/24',
                            'comment': [
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                            ]
                          }, // Truyền data vào LoadCommentWidget
                          onOptionSelected: (String option) {
                            // Handle option selected here
                            Navigator.pop(context); // Close modal
                            // Add your logic based on the selected option
                          },
                        ),
                      );
                    },
                  );
                },
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
