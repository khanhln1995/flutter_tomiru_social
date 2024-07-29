import 'package:flutter/material.dart';

class Posting2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/mark-zuckerberg.jpg")),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Text(
                    'Bạn hãy viết gì đó...',
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                  Spacer(),
                  // Icon(Icons.image, color: Colors.blue),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          // Container(
          //     height: 50,
          //     width: 50,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       shape: BoxShape.circle,
          //     ),
          //     child: Image.asset("assets/images/settings-filter.png")),
        ],
      ),
    );
  }
}
