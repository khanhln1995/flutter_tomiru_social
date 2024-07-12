import 'package:flutter/material.dart';
class CommentItem extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String comment;
  final String timeAgo;

  const CommentItem({
    Key? key,
    required this.avatarUrl,
    required this.userName,
    required this.comment,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(comment),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Thích', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Trả lời', style: TextStyle(color: Colors.grey)),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.grey),
                    ),
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