import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/contact_slide.dart';

class ContactWithOthers extends StatelessWidget {
  // ContactWithOthers({super.key});
  final List<Map<String, dynamic>> contacts = [
    {
      "avatar":
          "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg",
      "userName": 'Vũ Phương Link',
      "role": 'Khách hàng',
      "mutual_friend": 12,
      "mutual_group": 4
    },
    {
      "avatar":
          "https://gamek.mediacdn.vn/133514250583805952/2023/3/30/3-16801459299871350262286-1680150078773-16801500790972016278513.png",
      "userName": 'Tanjiro',
      "role": 'Kẻ bất dung thú',
      "mutual_friend": 12,
      "mutual_group": 4
    },
    {
      "avatar":
          "https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg",
      "userName": 'ronando',
      "role": "Nhà đầu tư",
      "mutual_friend": 0,
      "mutual_group": 8
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 150,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 12.0),
          scrollDirection: Axis.horizontal,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return HorizontalContactMember(
              avatar: contacts[index]['avatar'],
              username: contacts[index]['userName'],
              role: contacts[index]['role'],
              mutual_friend: contacts[index]['mutual_friend'],
              mutual_group: contacts[index]['mutual_group'],
            );
          }),
    );
  }
}
