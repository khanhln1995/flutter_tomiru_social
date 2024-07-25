import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/body_message.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/bottom_bar_message.dart';
import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/bottom_menu_bar.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';

import 'package:tomiru_social_flutter/widgets/custom_icon_widgets.dart';

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
          customQr(),
          customMessage(context),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
        padding: 12.0,
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  BodyMessage(),
      )),
      bottomNavigationBar: const BottomBarMessage(),

    );
  }
}
