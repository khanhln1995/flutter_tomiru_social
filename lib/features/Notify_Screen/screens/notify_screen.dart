import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Notify_Screen/widgets/setting_notify_dialog.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon_widgets.dart';
import "package:tomiru_social_flutter/features/Notify_Screen/widgets/body_notify_screen.dart";
class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}


class _NotifyScreenState extends State<NotifyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(230, 236, 240, 1.0),
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        mainTitle: 'Thông báo',
        padding: 0,
        leadingWidth: MediaQuery.of(context).size.width / 3,
        widget: [
          customSetting(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height *
                            0.2, // Adjust this value as needed
                        left: 0,
                        right: 0,
                        child: SettingNotifyDialog(),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          const SizedBox(width: 12.0),

        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:const BodyNotifyScreen(),
      )),
    );
  }
}
