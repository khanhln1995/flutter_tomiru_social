import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/body_message.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/bottom_bar_message.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/body_phonebook.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/reminder_page/body_reminder.dart';
import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/bottom_menu_bar.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';

import 'package:tomiru_social_flutter/widgets/custom_icon_widgets.dart';

//!
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/Friends/Screens/Friend_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Page.dart';

import 'package:tomiru_social_flutter/state/message_controller.dart';
import "package:tomiru_social_flutter/features/short_video/screens/short_video_page.dart";
// import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Screen.dart';
import 'package:tomiru_social_flutter/features/Home/Screens/Social_page.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/discovery_page.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(230, 236, 240, 1.0),
      appBar: CustomAppBar(
        onBackPress: () {
          Navigator.pop(context);
        },
        image: "assets/images/logo-tomiru-v2.png",
        widget: <Widget>[
          customQr(context),
          customMessage(context),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
        padding: 12.0,
      ),
      body: _body(),
      bottomNavigationBar: const BottomBarMessage(),

    );
  }
  Widget _body() {
    return SafeArea(
      child: Obx(() {
        final pageIndex = Get.find<MessageController>().pageIndex.value;
        return getPage(pageIndex);
      }),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        // return FeedPage(
        //   scaffoldKey: _scaffoldKey,
        //   refreshIndicatorKey: refreshIndicatorKey,
        // );
        return BodyMessage();
      case 1:
        return BodyPhonebook();
      case 2:
        return  BodyReminder();
     
     
      default:
        // return FeedPage(scaffoldKey: _scaffoldKey);
        return BodyMessage();
    }
  }
}
