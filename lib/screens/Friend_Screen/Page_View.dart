import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/Friend_Screen/Friend_Screen.dart';
import './Post_Friends.dart';

class PageViewFriend extends StatefulWidget {
  const PageViewFriend({Key? key}) : super(key: key);

  @override
  State<PageViewFriend> createState() => _PageViewFriendState();
}

class _PageViewFriendState extends State<PageViewFriend> {
  int _innerPageIndex = 0;

  final List<Widget> _innerPages = [
    PostFriends(navigateTo: _navigateTo),
    Friends(tabBarView: 0, navigateTo: _navigateTo),
    Friends(tabBarView: 1, navigateTo: _navigateTo),
    Friends(tabBarView: 2, navigateTo: _navigateTo),
  ];

  static void _navigateTo(BuildContext context, int index) {
    final pageViewFriendState =
        context.findAncestorStateOfType<_PageViewFriendState>();
    pageViewFriendState?.setState(() {
      pageViewFriendState._innerPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _innerPageIndex,
        children: _innerPages,
      ),
    );
  }
}
