

import 'package:flutter/material.dart';
import '../../widgets/global/timeLine/timeLine.dart';
import '../../widgets/friends_widget/custom_tabbar.dart';
import '../../widgets/friends_widget/custom_white_app_bar.dart';

class PostFriends extends StatefulWidget {
  final void Function(BuildContext, int) navigateTo;

  PostFriends({Key? key, required this.navigateTo}) : super(key: key);

  @override
  State<PostFriends> createState() => _PostFriendsState();
}

class _PostFriendsState extends State<PostFriends> {
  dynamic navigateTo;

  @override
  void initState() {
    super.initState();
    navigateTo = widget.navigateTo;
  }

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double vertical = MediaQuery.of(context).size.height * 0.024;
    double horizontal = MediaQuery.of(context).size.width * 0.04;
    double sizedBoxWidth = MediaQuery.of(context).size.width * 0.06;
    double widthTabBar = MediaQuery.of(context).size.width * 0.21;
    double heightTabBar = MediaQuery.of(context).size.height * 0.036;

    Widget Avatar() {
      double imageSize = MediaQuery.of(context).size.width * 0.12;
      return Container(
        width: imageSize,
        height: imageSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/mark-zuckerberg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget PostButton() {
      double subtitleSize = MediaQuery.of(context).size.width * 0.035;
      double postButtonWidth = MediaQuery.of(context).size.width * 0.58;
      double postButtonHeight = MediaQuery.of(context).size.width * 0.14;
      double paddingPostButton = MediaQuery.of(context).size.width * 0.06;
      return Container(
        width: postButtonWidth,
        height: postButtonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: paddingPostButton),
            side: const BorderSide(
                color: Color.fromARGB(255, 194, 193, 209), width: 0.3),
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bạn viết gì đi...",
              style: TextStyle(
                fontSize: subtitleSize,
                fontFamily: "Avenir",
                color: const Color.fromARGB(255, 194, 193, 209),
              ),
            ),
          ),
        ),
      );
    }

    Widget QRButton() {
      double QRIcon = MediaQuery.of(context).size.width * 0.06;
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        child: ClipRect(
          child: Container(
            width: QRIcon,
            height: QRIcon,
            child: Image.asset(
              "assets/images/icon-QRcode.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return CustomWhiteAppBar(
      text: "Bạn bè",
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontal,
                  vertical: vertical,
                ),
                width: widthBody,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Avatar(),
                            PostButton(),
                            QRButton(),
                          ]),
                      SizedBox(
                        height: sizedBoxWidth,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTabBar(
                            title: "Bài viết",
                            isSelected: true,
                            width: widthTabBar,
                            height: heightTabBar,
                          ),
                          CustomTabBar(
                            title: "Lời mời",
                            isSelected: false,
                            width: widthTabBar,
                            height: heightTabBar,
                            action: () {
                              setState(() {
                                navigateTo(context, 1);
                              });
                            },
                          ),
                          CustomTabBar(
                              title: "Bạn bè",
                              isSelected: false,
                              width: widthTabBar,
                              height: heightTabBar,
                              action: () {
                                setState(() {
                                  navigateTo(context, 2);
                                });
                              }),
                          CustomTabBar(
                              title: "Gợi ý",
                              isSelected: false,
                              width: widthTabBar,
                              height: heightTabBar,
                              action: () {
                                setState(() {
                                  navigateTo(context, 3);
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              color: const Color.fromARGB(255, 243, 241, 241),
              height: 6.0,
              width: double.infinity,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: TimeLine(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
