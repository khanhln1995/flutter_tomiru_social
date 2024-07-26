import 'package:flutter/material.dart';

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