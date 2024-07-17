import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_color_widget.dart'
    as CustomAppColor;
import 'package:tomiru_social_flutter/screens/message/widgets/custom_group_chat_avatar_widget.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_inline_widget.dart';

class ListGroupChat extends StatefulWidget {
  const ListGroupChat({super.key});

  @override
  State<ListGroupChat> createState() => _ListGroupChatState();
}

class _ListGroupChatState extends State<ListGroupChat> {
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Hội nghị đa quốc gia',
      'image1':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'image2':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'image3':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'image4':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '15 phút',
      'newMessage': '1'
    },
    {
      'title': 'Hội tìm kiếm hòa bình',
      'image1':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'image2':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'image3':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'image4':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '20 phút',
      'newMessage': '3'
    },
    {
      'title': 'Hội trao đổi kinh nghiệm làm tổng thống',
      'image1':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'image2':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'image3':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'image4':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '10 phút',
      'newMessage': ''
    },
    {
      'title': 'Scandal của các tổng thống',
      'image1':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'image2':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'image3':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'image4':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
      'finalContentChat': 'oke em',
      'timeOff': '5 phút',
      'newMessage': '2'
    },
    {
      'title': 'Nhóm share bí mật quốc gia',
      'image1':
          'https://media.cnn.com/api/v1/images/stellar/prod/220228151805-putin-0218.jpg?c=16x9&q=h_833,w_1480,c_fill',
      'image2':
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202203/Zelenskyy__AP__1200x768.jpeg?size=690:388',
      'image3':
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg',
      'image4':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/800px-Joe_Biden_presidential_portrait.jpg',
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
                    leading: CustomGroupChatAvatar(
                      image1: data[index]['image1'],
                      image2: data[index]['image2'],
                      image3: data[index]['image3'],
                      image4: data[index]['image4'],
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
                  padding: const EdgeInsets.only(left: 54),
                  child: CustomInline(width: 310),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
