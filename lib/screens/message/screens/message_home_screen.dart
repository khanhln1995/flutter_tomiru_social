import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/message/screens/list_chat_screen.dart';
import 'package:tomiru_social_flutter/screens/message/screens/list_group_chat_screen.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_app_bar_widget.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_popup_menu_button_widget.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_inline_widget.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_text_field_widget.dart';
import 'package:tomiru_social_flutter/screens/message/screens/group_creation_screen.dart';
import 'package:tomiru_social_flutter/screens/message/screens/new_message_screen.dart';
import 'package:tomiru_social_flutter/screens/message/screens/group_calendar_creation_screen.dart';
import 'package:tomiru_social_flutter/screens/message/widgets/custom_color_widget.dart'
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
