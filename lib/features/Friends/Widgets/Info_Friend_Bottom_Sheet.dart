import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoFriend extends StatelessWidget {
  final listName;
  final int index;
  late String avatarImage;
  late String friendName;

  InfoFriend({
    Key? key,
    this.listName,
    required this.index,
    required this.avatarImage,
    required this.friendName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.14;
    double fontSize = MediaQuery.of(context).size.width * 0.041;

    return Container(
      alignment: Alignment.centerLeft,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipOval(
          child: Image.asset(
            listName[index][avatarImage],
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          listName[index][friendName],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
        subtitle: const Text(
          "Là bạn bè từ Tháng 9 năm 2019",
          style: TextStyle(color: Color.fromARGB(255, 141, 140, 140)),
        ),
      ),
    );
  }
}
