import 'dart:convert';
import 'package:flutter/material.dart';
import '../../widgets/Open_Bottom_Sheet.dart';
import '../../widgets/Body_Bottom_Sheet_Sort.dart';
import '../../widgets/Info_Friend_Bottom_Sheet.dart';
import "../../../../common/widgets/friends2_widget/friends_button.dart";
import 'package:shimmer/shimmer.dart';

class PageView2 extends StatefulWidget {
  PageView2({Key? key}) : super(key: key);

  @override
  State<PageView2> createState() => _PageView2State();
}

class _PageView2State extends State<PageView2> {
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
    double imageSize = MediaQuery.of(context).size.width * 0.14;
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
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
                            const Sort(),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10.0), // Added margin top 10px
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
                ],
              ),
              SizedBox(
                  height:
                      5.0), // Added SizedBox to separate "Sắp xếp" and ListView
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  left: paddingListView,
                  right: paddingListView,
                  top: paddingTopListView +
                      5.0, // Adjusted top padding with additional 5px
                ),
                itemCount: friends == null ? 0 : friends.length,
                itemBuilder: (_, i) {
                  return (friends[i]["avatarImage"] != null &&
                          friends[i]["friendName"] != null &&
                          friends[i]["mutualFriends"] != null)
                      ? Column(
                          children: [
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
                                    fontSize: fontSize,
                                  ),
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
                                          text:
                                              "Chặn ${friends[i]["friendName"]}",
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
                                color: Color.fromARGB(255, 243, 241, 241),
                              ),
                            ),
                          ],
                        )
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            children: [
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
                                margin:
                                    EdgeInsets.symmetric(horizontal: margin),
                                width: double.infinity,
                                height: 1.3,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 243, 241, 241),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}