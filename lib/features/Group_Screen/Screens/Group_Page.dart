import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Manage_Event.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Manage_Group.dart';
import 'Group_Bar.dart';
import 'ForYou.dart';
import "My_Group.dart";

class GroupPage extends StatefulWidget {
  final bool showEventExist; // Thêm tham số showEventExist
  final int initialPageIndex;
  const GroupPage(
      {Key? key, this.initialPageIndex = 0, this.showEventExist = false})
      : super(key: key); 
  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  int _innerPageIndex = 0;
  final bool showEventExist = false; // Thêm tham số showEventExist
  
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
      // _innerPageIndex = widget.initialPageIndex;
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
              children: _innerPages.map((page) {
                if (page is ManageEvent) {
                  return ManageEvent(
                      showEventExist: widget
                          .showEventExist); // Truyền showEventExist cho ManageEvent
                } else {
                  return page;
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}