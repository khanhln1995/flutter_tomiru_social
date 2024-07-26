import 'package:flutter/material.dart';
import '../widgets/friend_bar.dart';
import 'page_view/page_view0.dart';
import "page_view/page_view1.dart";
import "page_view/page_view2.dart";
import "page_view/page_view3.dart";
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon_widgets.dart';

class Friend2Screen extends StatefulWidget {
  const Friend2Screen({Key? key}) : super(key: key);

  @override
  State<Friend2Screen> createState() => _Friend2ScreenState();
}

class _Friend2ScreenState extends State<Friend2Screen> {
  int _innerPageIndex = 0;

  final List<Widget> _innerPages = [
    PageView0(),   
    PageView3(),
    PageView2(),
    PageView1(),
   
  ];

  void _navigateTo(int index) {
    // print("===============ERROR================");
    // print(index);
    // print("===============ERROR================");
    setState(() {
      _innerPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: 'Bạn bè',
        padding: 0,
        widget: [
          customQr(),
          customMessage(context),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
      ),
      body: Column(
        children: [
          FriendBar(navigateTo: _navigateTo), // Pass the _navigateTo function
          Expanded(
            child: IndexedStack(
              index: _innerPageIndex,
              children: _innerPages,
            ),
          ),
        ],
      ),
    );
  }
}
