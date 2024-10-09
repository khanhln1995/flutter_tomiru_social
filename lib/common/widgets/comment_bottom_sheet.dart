import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tomiru_social_flutter/features/social_tweet/controller/social_controller.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/helper/comment.dart';
import 'package:tomiru_social_flutter/common/widgets/comment/comment_tree_widget.dart';
import 'package:tomiru_social_flutter/ui/theme/tree_theme.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/bar_under_cmt.dart';
import 'package:tomiru_social_flutter/common/widgets/comment/reaction_comment.dart';

class CommentArea extends StatefulWidget {
  final int tweetId;
  CommentArea({super.key, required this.tweetId});
  @override
  State<CommentArea> createState() => _CommentAreaState();
}

class _CommentAreaState extends State<CommentArea> {
  final TextEditingController _textEditingController = TextEditingController();
  late ScrollController _scrollController;
  late List<int> cmtOpens = [];
  late List<Map<String, dynamic>> comments = [
    {
      'id': 1,
      'avatar': 'https://avatar.iran.liara.run/public/42',
      'userName': 'Phương nguyễn',
      'content': 'Em chào anh ạ!',
      'time': '16 giờ',
      'likes': 0,
      'reply': []
    },
    {
      'id': 2,
      'avatar': 'https://avatar.iran.liara.run/public/42',
      'userName': 'Phương nguyễn',
      'content': 'Bạn tư vấn chi tiết cho mình ngôi nhà này với ạ. Đẹp quá!!!',
      'time': '16 giờ',
      'likes': 100,
      'reply': [
        {
          'avatar': 'https://robohash.org/stefan-one',
          'userName': 'Cristianronaldo',
          'content': '你不知道你有多可爱跌倒后会傻笑着再站起来你从来都不来',
          'time': 'Vừa xong',
          'likes': 100,
        },
      ]
    },
    {
      'id': 3,
      'avatar': 'https://avatar.iran.liara.run/public/42',
      'userName': 'Phương nguyễn',
      'content': 'Bạn tư vấn chi tiết cho mình ngôi nhà này với ạ. Đẹp quá!!!',
      'time': '16 giờ',
      'likes': 100,
      'reply': [
        {
          'avatar': 'https://robohash.org/stefan-one',
          'userName': 'Bruno',
          'content':
              '你不知道你有多可爱跌倒后会傻笑着再站起来你从来都不轻言失败对梦想的执着一直不曾更改很安心 当你对我说不怕有我在 放着让我来',
          'time': 'Vừa xong',
          'likes': 100,
        },
        {
          'avatar': 'https://robohash.org/stefan-one',
          'userName': 'Abc',
          'content': 'ok',
          'time': 'Vừa xong',
          'likes': 0,
        },
      ]
    },
    {
      'id': 4,
      'avatar': 'https://robohash.org/stefan-one',
      'userName': 'Phương nguyễn',
      'content': 'Bạn tư vấn chi tiết cho mình ngôi nhà này với ạ. Đẹp quá!!!',
      'time': '16 giờ',
      'likes': 100,
      'reply': []
    },
  ];
  List<Tweet> reply = [];
  @override
  void initState() {
    super.initState();
    Get.find<SocialController>().getRepliesByTweetId(3);
    reply = Get.find<SocialController>().reply;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    cmtOpens = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              const Center(
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    height: 2.0,
                    thickness: 4.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              LikeCounter(),
              const SizedBox(height: 4.0),
              Expanded(
                child: CommentList(
                    scrollController: _scrollController,
                    comments: comments,
                    cmtOpens: cmtOpens),
              ),
              const SizedBox(height: 8.0),
              CommentInput(textController: _textEditingController),
            ],
          ),
        );
      },
    );
  }
}

class CommentList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Map<String, dynamic>> comments;
  // final List<int> cmtOpens;
  final List<int> cmtOpens;
  const CommentList(
      {super.key,
      required this.scrollController,
      required this.comments,
      required this.cmtOpens});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      // thickness: 6.0,
      radius: const Radius.circular(10.0),
      child: ListView.builder(
        controller: scrollController,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CommentTreeWidget<Comment, Comment>(
              Comment(
                  avatar: comments[index]['avatar'],
                  userName: comments[index]['userName'],
                  content: comments[index]['content'],
                  time: comments[index]['time'],
                  likes: comments[index]['likes']),
              comments[index]['reply'].map<Comment>((e) {
                return Comment(
                    avatar: e['avatar'],
                    userName: e['userName'],
                    content: e['content'],
                    time: e['time'],
                    likes: e['likes']);
              }).toList(),
              treeThemeData:
                  TreeThemeData(lineColor: Colors.grey[400]!, lineWidth: 2),
              avatarRoot: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage('${data.avatar}'),
                ),
                preferredSize: Size.fromRadius(18),
              ),
              avatarChild: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage('${data.avatar}'),
                ),
                preferredSize: Size.fromRadius(12),
              ),
              contentChild: (context, data) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        if (!cmtOpens.contains(comments[index]['id'])) {
                          cmtOpens.add(comments[index]['id']);
                        }
                      });
                    },
                    child: !cmtOpens.contains(comments[index]['id'])
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${data.userName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  '${data.content}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.userName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '${data.content}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              DefaultTextStyle(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                child: Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: CommentBar(
                                        likes: data.likes, time: data.time)),
                              )
                            ],
                          ));
              },
              contentRoot: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.userName}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '${data.content}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                      child: Padding(
                          padding: EdgeInsets.only(top: 4),
                          child:
                              CommentBar(likes: data.likes, time: data.time)),
                    )
                  ],
                );
              },
            );
          });
        },
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  final TextEditingController textController;
  CommentInput({super.key, required this.textController});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[300] ?? Colors.grey),
          ),
        ),
        child: Center(
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.image, color: Colors.blue),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send, color: Colors.grey),
              ),
              hintText: 'Viết bình luận',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
