import 'package:flutter/material.dart';

class Message {
  final String username;
  final String content;
  final String deliveredTime;
  final bool isNew;
  final String avatar;

  Message({
    required this.username,
    required this.content,
    required this.deliveredTime,
    required this.isNew,
    required this.avatar,
  });
}

class PageView1 extends StatefulWidget {
  @override
  _PageView1State createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  final paddingTextInTextField = 14.0;

  List<Message> messages = [
    Message(
      username: 'Alice',
      avatar: 'assets/images/icon-tomiru-appbar.jpg',
      content: 'How are you?',
      deliveredTime: "15 phút",
      isNew: true,
    ),
    Message(
      username: 'Bob',
      avatar: 'assets/images/app-avatar.png',
      content: 'I am good. Thank you!',
      deliveredTime: "1 giờ trước",
      isNew: false,
    ),
    Message(
      username: 'Mark Zucc',
      avatar: 'assets/images/mark-zuckerberg.jpg',
      content: 'What are you doing tomorrow?',
      deliveredTime: "2 ngày trước",
      isNew: true,
    ),
    Message(
      username: 'Eve',
      avatar: 'assets/images/logo-tomiru-v2.png',
      content: 'Tôi đang ko vui',
      deliveredTime: "1 phút trước",
      isNew: false,
    ),
    Message(
      username: 'John Cela',
      avatar: 'assets/images/kem.jpg',
      content: 'Đi chơi không em',
      deliveredTime: "Hôm qua",
      isNew: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Gần đây ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Message message = messages[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: SizedBox(
                          width: 56,
                          height: 56,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(message.avatar),
                          ),
                        ),
                        title: Text(message.username,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(message.content,
                            style: TextStyle(fontSize: 14)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(message.deliveredTime),
                            if (message.isNew)
                              Container(
                                margin: EdgeInsets.only(top: 5.0),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300], // Set Divider color
                      thickness: 1, // Set Divider thickness
                      indent: 20, // Set start indent
                      endIndent: 20, // Set end indent
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
