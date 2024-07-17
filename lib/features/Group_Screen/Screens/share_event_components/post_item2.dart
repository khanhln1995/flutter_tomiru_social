import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Event_Test.dart';

class PostItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage("assets/images/mark-zuckerberg.jpg")),
              title: Row(
                children: [
                  Expanded(
                      child: Text('Nguyen Nhung đã tạo một sự kiện riêng tư.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14))),
                  // SizedBox(width: 4),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(' 2 giờ •'),
                  Icon(Icons.public, size: 14),
                ],
              ),
            ),
            // EventTest()
            
          ],
        ),
      ),
    );
  }
}
