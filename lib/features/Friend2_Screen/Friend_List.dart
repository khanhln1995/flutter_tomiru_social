import 'dart:convert';
import 'package:flutter/material.dart';
import '../Friend_Screen/Body_Bottom_Sheet_Sort.dart';
import '../Friend_Screen/Body_Tabbar_Friends.dart';
import '../Friend_Screen/Info_Friend_Bottom_Sheet.dart';
import '../Friend_Screen/Open_Bottom_Sheet.dart';
import '../../widgets/friends_widget/friends_button.dart';

import 'package:shimmer/shimmer.dart';

class Friends extends StatefulWidget {
  dynamic tabBarView;
  final void Function(BuildContext, int) navigateTo;

  Friends({Key? key, this.tabBarView, required this.navigateTo})
      : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> with SingleTickerProviderStateMixin {
  late List friends;
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
    Widget PageView1() {
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
                    decoration: TextDecoration.underline, // Gạch chân
                    decorationColor: const Color.fromARGB(
                        255, 6, 133, 236), // Màu gạch chân (tùy chọn)
                    decorationThickness: 1.5, // Độ dày gạch chân (tùy chọn)
                    fontSize: fontSizeStackButton,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget PageView2() {
      double imageSize = MediaQuery.of(context).size.width * 0.14;
      double height = MediaQuery.of(context).size.height;
      double paddingListView = MediaQuery.of(context).size.width * 0.02;
      double paddingTopListView = MediaQuery.of(context).size.width * 0.065;
      double margin = MediaQuery.of(context).size.width * 0.027;
      double heightListTile = MediaQuery.of(context).size.height * 0.12;
      double fontSize = MediaQuery.of(context).size.width * 0.041;
      double heightTitle = MediaQuery.of(context).size.height * 0.022;
      double heightSubTitle = MediaQuery.of(context).size.height * 0.015;
      double widthButton = MediaQuery.of(context).size.width * 0.095;
      double iconSize = MediaQuery.of(context).size.width * 0.08;
      double fontSizeStack = MediaQuery.of(context).size.width * 0.045;
      double marginStack = MediaQuery.of(context).size.width * 0.061;
      double heightStack = MediaQuery.of(context).size.height * 0.033;

      return Container(
        width: double.infinity,
        height: height,
        child: Stack(children: [
          ListView.builder(
            padding: EdgeInsets.only(
              left: paddingListView,
              right: paddingListView,
              top: paddingTopListView,
            ),
            itemCount: friends == null ? 0 : friends.length,
            itemBuilder: (_, i) {
              return (friends[i]["avatarImage"] != null &&
                      friends[i]["friendName"] != null &&
                      friends[i]["mutualFriends"] != null)
                  ? Column(children: [
                      Container(
                        alignment: Alignment.center,
                        height: heightListTile,
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              friends[i]["avatarImage"],
                              width: imageSize,
                              height: imageSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            friends[i]["friendName"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize),
                          ),
                          subtitle: Text(friends[i]["mutualFriends"]),
                          trailing: GestureDetector(
                            onTap: () => OpenBottomSheet(
                              context,
                              InfoFriend(
                                listName: friends,
                                index: i,
                                avatarImage: "avatarImage",
                                friendName: "friendName",
                              ),
                              Column(
                                children: [
                                  CustomButton(
                                    icon: Icons.message,
                                    text:
                                        "Nhắn tin cho ${friends[i]["friendName"]}",
                                  ),
                                  CustomButton(
                                    icon: Icons.person_remove,
                                    text:
                                        "Bỏ theo dõi ${friends[i]["friendName"]}",
                                  ),
                                  CustomButton(
                                    icon: Icons.block,
                                    text: "Chặn ${friends[i]["friendName"]}",
                                  ),
                                  CustomButton(
                                    icon: Icons.person_off,
                                    text:
                                        "Hủy kết bạn với ${friends[i]["friendName"]}",
                                  ),
                                ],
                              ),
                            ),
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
                                Icons.more_horiz,
                                size: iconSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        width: double.infinity,
                        height: 1.3,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 241, 241)),
                      )
                    ])
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.center,
                          height: heightListTile,
                          child: ListTile(
                            leading: Container(
                              width: imageSize,
                              height: imageSize,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                            ),
                            title: Container(
                              height: heightTitle,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                              ),
                            ),
                            subtitle: Container(
                              height: heightSubTitle,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                              ),
                            ),
                            trailing: GestureDetector(
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
                                  Icons.more_horiz,
                                  size: iconSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: margin),
                          width: double.infinity,
                          height: 1.3,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 243, 241, 241)),
                        )
                      ]),
                    );
            },
          ),
          Container(
            height: heightStack,
            margin: EdgeInsets.symmetric(horizontal: marginStack),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${friends == null ? 0 : friends.length} bạn bè",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizeStack,
                  ),
                ),
                GestureDetector(
                  onTap: () => OpenBottomSheet(
                      context,
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Sắp xếp",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Sort()),
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
                      Icons.import_export_rounded,
                      size: iconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    }

    Widget PageView3() {
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

    Widget PageView4() {
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
return const Scaffold(
  
);
  }
}
