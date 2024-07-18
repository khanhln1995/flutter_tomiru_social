// import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';

class CommentArea extends StatefulWidget {
  const CommentArea({super.key});

  @override
  State<CommentArea> createState() => _CommentAreaState();
}

class _CommentAreaState extends State<CommentArea> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          // height: constraints.maxHeight,
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
              const SizedBox(height: 8.0),
              Expanded(
                child: CommentList(scrollController: _scrollController),
              ),
              CommentInput(),
            ],
          ),
        );
      },
    );
  }
}

class LikeCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.thumb_up, color: Colors.blue),
          SizedBox(width: 4),
          Text('361k', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  final ScrollController scrollController;
  const CommentList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      // thickness: 6.0,
      radius: const Radius.circular(10.0),
      child: ListView(
        controller: scrollController,
        children: [
          CommentItem(
            avatarUrl: 'https://example.com/avatar1.jpg',
            name: 'Phương nguyễn',
            content: 'Em chào anh ạ!',
            time: '16 giờ',
            likes: 0,
          ),
          CommentItem(
            avatarUrl: 'https://example.com/avatar2.jpg',
            name: 'Phương nguyễn',
            content:
                'Bạn tư vấn chi tiết cho mình ngôi nhà này với ạ. Đẹp quá!!!',
            time: '16 giờ',
            likes: 100,
          ),
          // Thêm nhiều CommentItem khác nếu cần
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String content;
  final String time;
  final int likes;

  const CommentItem({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.content,
    required this.time, 
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(content),
                Row(
                  children: [
                    Text(time, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 16),
                    const Text('Thích',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    if (likes > 0) ...[
                      const SizedBox(width: 8),
                      Text('($likes)',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Viết bình luận...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle sending comment
            },
          ),
        ],
      ),
    );
  }
}
