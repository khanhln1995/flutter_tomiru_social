import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  final int? likes;
  final String? time;
  const CommentBar({super.key, required this.likes, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(time!,
          style: TextStyle(color: Colors.grey, fontSize: 12)),
      const SizedBox(width: 10.0),
      InkWell(
          onTap: () {},
          child: Text(likes! > 0 ? 'Thích ($likes)' : 'Thích', style: TextStyle(fontSize: 12))),
      const SizedBox(width: 10.0),
      InkWell(
          onTap: () {},
          child: const Text('Trả lời', style: TextStyle(fontSize: 12))),
    ]);
  }
}
