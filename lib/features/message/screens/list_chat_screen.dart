import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/screens/chat_screen.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_inline_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Vladimir Putin',
      'image':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'finalContentChat': 'oke em',
      'timeOff': '15 phút',
      'newMessage': 1
    },
    {
      'title': 'Donald Trump',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '20 phút',
      'newMessage': 13
    },
    {
      'title': 'Barack Obama',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '10 phút',
      'newMessage': 0
    },
    {
      'title': 'Joe Biden',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '5 phút',
      'newMessage': 2
    },
    {
      'title': 'Volodymyr Zelenskyy',
      'image':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'finalContentChat': 'oke em',
      'timeOff': '3 phút',
      'newMessage': 12
    },
    {
      'title': 'Luna De Malavonkavuesunamira',
      'image': 'https://trithucvn.co/wp-content/uploads/2018/05/Nguoi-Phap.jpg',
      'finalContentChat': 'Bonjou xamalikha',
      'timeOff': '7 phút',
      'newMessage': 10
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Container(
              color: CustomAppColor.backgroundListTile,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: CustomAppColor.pictureFrame,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      data[index]['image'],
                      width: size.width / 9,
                      height: size.width / 9,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  data[index]['title'],
                  style: TextStyle(
                    fontSize: size.width / 22,
                  ),
                ),
                subtitle: Text(data[index]['finalContentChat'],
                    style: TextStyle(
                      fontSize: size.width / 31,
                      color: CustomAppColor.subTitle,
                    )),
                trailing: data[index]['newMessage'] != 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: size.height / 120),
                          Text(data[index]['timeOff'],
                              style: TextStyle(
                                  color: CustomAppColor.subTitle,
                                  fontSize: size.width / 30)),
                          SizedBox(height: size.height / 100),
                          Container(
                            width: size.width / 22,
                            height: size.width / 22,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: CustomAppColor.notificationNewMessage,
                              shape: BoxShape.circle,
                            ),
                            child: (data[index]['newMessage'] <= 10 &&
                                    data[index]['newMessage'] > 0)
                                ? Text(data[index]['newMessage'].toString(),
                                    style: TextStyle(
                                        color: CustomAppColor
                                            .notificationNewMessageText,
                                        fontSize: size.width / 40,
                                        fontWeight: FontWeight.bold))
                                : (data[index]['newMessage'] > 10)
                                    ? Text('10+',
                                        style: TextStyle(
                                            color: CustomAppColor
                                                .notificationNewMessageText,
                                            fontSize: size.width / 53,
                                            fontWeight: FontWeight.bold))
                                    : Container(),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: size.height / 120),
                          Text(data[index]['timeOff'],
                              style: TextStyle(
                                  color: CustomAppColor.subTitle,
                                  fontSize: size.width / 30)),
                        ],
                      ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chat(listName: data, index: index)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.145),
              child: CustomInline(width: size.width * 0.745),
            ),
          ],
        );
      },
    );
  }
}
