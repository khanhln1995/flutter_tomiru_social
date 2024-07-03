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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            '${widget.commentCount} Bình luận . ${widget.shareCount} Chia sẻ',
            style: const TextStyle(color: Color(0xff727272), fontSize: 11),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.isLikeActive = !widget.isLikeActive;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isLikeActive
                          ? const Color(0xffF6891F)
                          : const Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 16,
                      color: widget.isLikeActive
                          ? Colors.white
                          : const Color(0xffF6891F),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.messenger_outlined,
                      size: 16,
                      color: Color(0xffF6891F),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.reply_rounded,
                      size: 20,
                      color: Color(0xffF6891F),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(widget.likeCount),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6891F),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.thumb_up_alt_rounded,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        )
      ],
    );
  }
}
