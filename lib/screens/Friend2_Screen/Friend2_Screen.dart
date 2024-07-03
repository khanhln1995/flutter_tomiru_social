import 'package:flutter/material.dart';
import '../Friend2_Screen/Friend_Bar.dart';
// import 'GroupBar.dart';
import 'For_You.dart';
import "My_Group.dart";
// import "ManageGroup.dart";
import "PageView/Page_View1.dart";
import "PageView/Page_View2.dart";
class Friend2Screen extends StatefulWidget {
  const Friend2Screen({Key? key}) : super(key: key);

  @override
  State<Friend2Screen> createState() => _Friend2ScreenState();
}

class _Friend2ScreenState extends State<Friend2Screen> {
  int _innerPageIndex = 0;

  final List<Widget> _innerPages = [
    ForYou(),
    MyGroup(),
    PageView1(),
    PageView2(),
    // ManageGroup(),
    // ManageEvent(),
    // EventExist()
  
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
