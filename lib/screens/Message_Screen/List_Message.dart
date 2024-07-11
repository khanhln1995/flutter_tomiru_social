import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/List_Chat.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/List_Group_Chat.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_AppBar.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_PopupMenuButton.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Inline.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Textfield.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Group_Creation.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/New_Message.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Group_Calendar_Creation.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Color.dart'
    as CustomAppColor;

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: CustomAppbar(
            title: 'Tin nhắn',
            redirect: () {},
          ),
        ),
        body: Column(
          children: [
            CustomInline(width: double.infinity),
            Container(
              width: double.infinity,
              color: CustomAppColor.backgroundTextField,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextfield(),
                  CustomPopupMenuButton(
                    groupCreationPage: GroupCreation(),
                    newMessagePage: NewMessage(),
                    groupCalendarCreationPage: GroupCalendarCreation(),
                  ),
                ],
              ),
            ),
            CustomInline(width: double.infinity),
            Container(
              width: double.infinity,
              height: 45,
              color: CustomAppColor.backgroundTabBar,
              child: TabBar(
                indicatorColor: CustomAppColor.indicatorTabBar,
                labelColor: CustomAppColor.titleTabBar,
                unselectedLabelColor: CustomAppColor.unselectedTitleTabBar,
                tabs: [
                  Tab(text: 'Cuộc trò chuyện'),
                  Tab(text: 'Nhóm chat'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListChat(),
                  ListGroupChat(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
