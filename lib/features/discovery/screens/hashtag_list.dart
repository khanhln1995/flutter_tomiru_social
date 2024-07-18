import 'package:flutter/material.dart';

class HashtagListScreen extends StatelessWidget {
  final List<String> hashtags = [
    'Dự án',
    'Nhà bán',
    'Nhà thuê',
    'Cho thuê',
    'Sự kiện',
    'Vay mua nhà',
    'Tin tức',
    'Dịch vụ',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Wrap(
        spacing: 16.0, // Khoảng cách ngang giữa các hashtag
        runSpacing: 16.0, // Khoảng cách dọc giữa các dòng
        children: hashtags.map((hashtag) {
          return Text('#$hashtag',
              style: TextStyle(color: Color.fromRGBO(29, 155, 240, 1)));
        }).toList(),
      ),
    );
  }
}
