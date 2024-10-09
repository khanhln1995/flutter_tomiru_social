import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/features/social_tweet/controller/social_controller.dart';
import 'package:tomiru_social_flutter/util/show_post_comments.dart';

class LikeBar extends StatefulWidget {
  final int likeCount;
  final int shareCount;
  final int commentCount;
  final int tweetId;
  final bool isTweetLiked;

  LikeBar({
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.tweetId,
    required this.isTweetLiked,
  });

  @override
  State<LikeBar> createState() => _LikeBarState();
}

class _LikeBarState extends State<LikeBar> {
  late bool isLikeActive;
  late int currentLikeCount;

  @override
  void initState() {
    super.initState();
    isLikeActive = widget.isTweetLiked;
    currentLikeCount = widget.likeCount;
  }

  void _toggleLike() {
    setState(() {
      isLikeActive = !isLikeActive;

      if (isLikeActive) {
        currentLikeCount += 1;
      } else {
        currentLikeCount -= 1;
      }
      Get.find<SocialController>().likeTweet(widget.tweetId);
    });
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
                  onTap: _toggleLike,
                  child: Icon(
                    isLikeActive
                        ? FontAwesomeIcons.solidThumbsUp
                        : FontAwesomeIcons.thumbsUp,
                    color: isLikeActive
                        ? Colors.blue
                        : Colors.grey, // Thay đổi màu sắc
                    size: 25,
                  ),
                ),
                const SizedBox(width: 10),
                Text(currentLikeCount.toString()), // Hiển thị số lượng thích
              ],
            ),
            Row(children: [
              InkWell(
                onTap: () {
                  showUnderBottomSheet(context, 0, widget.tweetId);
                },
                child: const Icon(Iconsax.message, size: 25),
              ),
              const SizedBox(width: 10.0),
              Text(widget.commentCount.toString()),
            ]),
            Row(children: [
              InkWell(
                onTap: () {
                  showUnderBottomSheet(context, 1, widget.tweetId);
                },
                child: const Icon(Iconsax.send_2, size: 25),
              ),
              const SizedBox(width: 10.0),
              Text(widget.shareCount.toString()),
            ]),
          ],
        ),
      ],
    );
  }
}
