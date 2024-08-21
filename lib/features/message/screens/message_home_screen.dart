import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/screens/list_chat_screen.dart';
import 'package:tomiru_social_flutter/features/message/screens/list_group_chat_screen.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_app_bar_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_popup_menu_button_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_inline_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_text_field_widget.dart';
import 'package:tomiru_social_flutter/features/message/screens/group_creation_screen.dart';
import 'package:tomiru_social_flutter/features/message/screens/new_message_screen.dart';
import 'package:tomiru_social_flutter/features/message/screens/group_calendar_creation_screen.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height / 13.6),
          child: CustomAppbar(
            title: 'Tin nhắn',
            redirect: () => Navigator.pop(context),
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
              height: size.height / 19.8,
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
