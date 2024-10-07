import 'package:flutter/material.dart';
import '../../../common/widgets/custom_appbar2.dart';
import "../../../common/widgets/friends2_widget/post_status_friend.dart";
import "../../../common/widgets/friends2_widget/search_input_friend.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_flutter/icons_flutter.dart';

class FriendBar extends StatefulWidget {
  final Function(int) navigateTo;

  FriendBar({Key? key, required this.navigateTo}) : super(key: key);

  @override
  State<FriendBar> createState() => _FriendBarState();
}

class _FriendBarState extends State<FriendBar> {
  int _selectedIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double tabBarHeight = widthBody * 0.075;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (_selectedIndex == 0)
            const Column(
              children: [
                PostStatusFriend(),
              ],
            ),
          if (_selectedIndex == 1 || _selectedIndex == 2 || _selectedIndex == 3)
            const Column(
              children: [
                SizedBox(height: 8),
                SearchInputFriend(),
                SizedBox(height: 10),
              ],
            ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTabBar2(
                    title: "Bài viết",
                    isSelected: _selectedIndex == 0,
                    width: widthBody * 0.25, // Adjust width as needed
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 0;
                        widget.navigateTo(0); // Notify parent widget
                      });
                    },
                  ),
                 
                  const SizedBox(width: 15), // 15px spacing
                  CustomTabBar2(
                    title: "Lời mời",
                    isSelected: _selectedIndex == 3,
                    width: widthBody * 0.25,
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 3;
                        widget.navigateTo(3); // Notify parent widget
                      });
                    },
                  ),
                  const SizedBox(width: 15), // 15px spacing
                  CustomTabBar2(
                    title: "Bạn bè",
                    isSelected: _selectedIndex == 2,
                    width: widthBody * 0.25,
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 2;
                        widget.navigateTo(2); // Notify parent widget
                      });
                    },
                  ),
                   const SizedBox(width: 15), // 15px spacing
                  CustomTabBar2(
                    title: "Gợi ý",
                    isSelected: _selectedIndex == 1,
                    width: widthBody * 0.25, // Adjust width as needed
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 1;
                        widget.navigateTo(1); // Notify parent widget
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          if(_selectedIndex == 1 || _selectedIndex == 2 || _selectedIndex == 3)
          Container(
            color: const Color.fromARGB(255, 243, 241, 241),
            height: 5,
            width: double.infinity,),
          
        ],
      ),
    );
  }
}
