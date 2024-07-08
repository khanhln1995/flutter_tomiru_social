import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './Body_Bottom_Sheet_Sort.dart';
import './Body_Tabbar_Friends.dart';
import './Info_Friend_Bottom_Sheet.dart';
import './Open_Bottom_Sheet.dart';
import '../../widgets/friends_widget/friends_button.dart';
import '../../widgets/friends_widget/custom_tabbar.dart';
import '../../widgets/friends_widget/custom_white_app_bar.dart';
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
  late ScrollController _scrollController;
  late TabController _tabController;
  dynamic navigateTo;

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
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = widget.tabBarView;
    navigateTo = widget.navigateTo;

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthPage = MediaQuery.of(context).size.width;
    double heightPage = MediaQuery.of(context).size.height;
    double heightBody = MediaQuery.of(context).size.width * 0.19;
    double paddingTop = MediaQuery.of(context).size.height * 0.035;
    double marginTextField = MediaQuery.of(context).size.width * 0.05;

    Widget InputFriendNames() {
      double paddingTextInTextField = MediaQuery.of(context).size.width * 0.01;

      return Container(
        alignment: Alignment.center,
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 128, 126, 126),
            ),
            hintText: "Nhập tên bạn bè",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 128, 126, 126),
            ),
            contentPadding: EdgeInsets.only(top: paddingTextInTextField),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 245, 244, 244),
          ),
        ),
      );
    }

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
                    color: Color.fromARGB(255, 6, 133, 236),
                    decoration: TextDecoration.underline, // Gạch chân
                    decorationColor: Color.fromARGB(
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
                        decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
                        child: Text(
                          "Sắp xếp",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Sort()),
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

    Widget TabBars() {
      double widthTabBar = MediaQuery.of(context).size.width * 0.28;
      double heightTabBar = MediaQuery.of(context).size.width * 0.08;
      double marginTabBar = MediaQuery.of(context).size.height * 0.015;
      double labelPaddingTabBar = MediaQuery.of(context).size.width * 0.05;
      double preferredSize = MediaQuery.of(context).size.height * 0.009;

      return Expanded(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool isScroll) {
            return [
              SliverAppBar(
                pinned: true,
                elevation: 0, // Xóa bỏ bóng dưới của SliverAppBar
                shadowColor: Colors.transparent, // Xóa bỏ màu bóng
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(preferredSize),
                  child: Container(
                    margin: EdgeInsets.only(bottom: marginTabBar),
                    child: TabBar(
                      indicator: BoxDecoration(), //ẩn thanh chỉ báo
                      labelPadding: EdgeInsets.only(right: labelPaddingTabBar),
                      controller: _tabController,
                      isScrollable: true,
                      tabs: [
                        CustomTabBar(
                          icon: Icons.mood,
                          title: "Lời mời",
                          isSelected: _tabController.index == 0,
                          width: widthTabBar,
                          height: heightTabBar,
                        ),
                        CustomTabBar(
                          icon: Icons.people,
                          title: "Bạn bè",
                          isSelected: _tabController.index == 1,
                          width: widthTabBar,
                          height: heightTabBar,
                        ),
                        CustomTabBar(
                          icon: Icons.lightbulb,
                          title: "Gợi ý",
                          isSelected: _tabController.index == 2,
                          width: widthTabBar,
                          height: heightTabBar,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              PageView1(),
              PageView2(),
              PageView3(),
            ],
          ),
        ),
      );
    }

    return Container(
      width: widthPage,
      height: heightPage,
      child: CustomWhiteAppBar(
        text: "Bạn bè",
        backButton: IconButton(
          onPressed: () {
            setState(() {
              navigateTo(context, 0);
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginTextField),
              padding: EdgeInsets.only(top: paddingTop),
              height: heightBody,
              width: widthPage,
              child: InputFriendNames(),
            ),
            TabBars(),
          ],
        ),
      ),
    );
  }
}
