import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Manage_Event.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Manage_Group.dart';
import 'Group_Bar.dart';
import 'ForYou.dart';
import "My_Group.dart";

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  int _innerPageIndex = 0;

  final List<Widget> _innerPages = [
    ForYou(),
    MyGroup(),
    ManageGroup(),
    ManageEvent(),
    // EventExist()
    // timeLine(),
    // Add more pages if needed
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
          GroupBar(navigateTo: _navigateTo), // Adding GroupBar
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