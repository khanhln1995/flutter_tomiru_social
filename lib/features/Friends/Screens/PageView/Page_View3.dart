import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Widgets/Open_Bottom_Sheet.dart';
import '../../Widgets/Body_Bottom_Sheet_Sort.dart';
import '../../Widgets/Info_Friend_Bottom_Sheet.dart';
import "../../../../widgets/friends_widget/friends_button.dart";
import 'package:shimmer/shimmer.dart';
import '../../Widgets/Body_Tabbar_Friends.dart';

class PageView3 extends StatefulWidget {
  PageView3({Key? key}) : super(key: key);

  @override
  State<PageView3> createState() => _PageView3State();
}

class _PageView3State extends State<PageView3> {
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
  Widget build(BuildContext context) {
    double widthButton = MediaQuery.of(context).size.width * 0.095;
    double iconSize = MediaQuery.of(context).size.width * 0.065;
    double marginStack = MediaQuery.of(context).size.width * 0.061;
    double heightStack = MediaQuery.of(context).size.height * 0.033;
    double fontSizeStack = MediaQuery.of(context).size.width * 0.045;

    return BodyTabBarFriend(
        listName: friends,
        avatarImage: "avatarImage",
        friendName: "friendName",
        mutualFriends: "mutualFriends",
        topOfTheList: Container(
          height: heightStack,
          margin: EdgeInsets.symmetric(horizontal: marginStack),
          alignment: Alignment.topLeft,
          child: Text(
            "Những người bạn có thể biết",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSizeStack,
            ),
          ),
        ),
        buttonInTheList: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: widthButton,
            height: widthButton,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            child: Icon(
              Icons.person_add_alt_outlined,
              size: iconSize,
            ),
          ),
        ));
  }


}