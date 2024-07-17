import 'dart:convert';
import 'package:flutter/material.dart';
import '../../widgets/Body_Tabbar_Friends.dart';

class PageView1 extends StatefulWidget {
  PageView1({Key? key}) : super(key: key);

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  late List<dynamic> friends = [];

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/data-friend/dataFriends.json")
        .then((s) {
      setState(() {
        friends = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    double widthButton = MediaQuery.of(context).size.width * 0.2;
    double heightButton = MediaQuery.of(context).size.height * 0.028;
    double fontSizeButton = MediaQuery.of(context).size.height * 0.014;
    double heightSizedBox = MediaQuery.of(context).size.height * 0.006;
    double fontSizeStack = MediaQuery.of(context).size.width * 0.045;
    double fontSizeStackButton = MediaQuery.of(context).size.width * 0.035;
    double marginStack = MediaQuery.of(context).size.width * 0.061;
    double heightStack = MediaQuery.of(context).size.height * 0.033;

    return BodyTabBarFriend(
      listName: friends,
      avatarImage: "avatarImage",
      friendName: "friendName",
      mutualFriends: "mutualFriends",
      buttonInTheList: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: widthButton,
              height: heightButton,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber[700],
              ),
              child: Text(
                "Xác nhận",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeButton,
                ),
              ),
            ),
          ),
          SizedBox(
            height: heightSizedBox,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: widthButton,
              height: heightButton,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.6,
                ),
              ),
              child: Text(
                "Hủy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSizeButton,
                ),
              ),
            ),
          ),
        ],
      ),
      topOfTheList: Container(
        height: heightStack,
        margin: EdgeInsets.symmetric(horizontal: marginStack),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Yêu cầu (${friends == null ? 0 : friends.length})",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSizeStack,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Xem tất cả",
                style: TextStyle(
                  color: const Color.fromARGB(255, 6, 133, 236),
                  decoration: TextDecoration.underline,
                  decorationColor: const Color.fromARGB(255, 6, 133, 236),
                  decorationThickness: 1.5,
                  fontSize: fontSizeStackButton,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
