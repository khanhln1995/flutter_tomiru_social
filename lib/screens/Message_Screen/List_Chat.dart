import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Color.dart'
    as CustomAppColor;
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Inline.dart';

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
      'newMessage': '1'
    },
    {
      'title': 'Donald Trump',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '20 phút',
      'newMessage': '3'
    },
    {
      'title': 'Barack Obama',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/8/8d/President_Barack_Obama.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '10 phút',
      'newMessage': ''
    },
    {
      'title': 'Joe Biden',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '5 phút',
      'newMessage': '2'
    },
    {
      'title': 'Volodymyr Zelenskyy',
      'image':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'finalContentChat': 'oke em',
      'timeOff': '3 phút',
      'newMessage': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
        return Stack(
          children: [
            Column(
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
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      data[index]['title'],
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(data[index]['finalContentChat'],
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                    trailing: data[index]['newMessage'] != ''
                        ? Column(
                            children: [
                              SizedBox(height: 11),
                              Text(data[index]['timeOff']),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color:
                                        CustomAppColor.notificationNewMessage,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(data[index]['newMessage'],
                                      style: TextStyle(
                                          color: CustomAppColor
                                              .notificationNewMessageText,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(height: 11),
                              Text(data[index]['timeOff']),
                            ],
                          ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 58),
                  child: CustomInline(width: 306),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
