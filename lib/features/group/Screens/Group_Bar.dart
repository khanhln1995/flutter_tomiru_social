import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Screens/Setting_Group.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_appbar2.dart';

class GroupBar extends StatefulWidget {
  final Function(int) navigateTo;

  const GroupBar({super.key, required this.navigateTo});

  @override
  State<GroupBar> createState() => _GroupBarState();
}

class _GroupBarState extends State<GroupBar> {
  int _selectedIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double tabBarHeight = widthBody * 0.075;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Colors.black,
              ),
              onPressed: () {
                // Handle back button action
              },
            ),
            title: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Nhóm"),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Handle add button action
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Handle search button action
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingGroup()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 243, 241, 241),
            height: 1.5,
            width: double.infinity,
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
                    title: "Dành cho bạn",
                    isSelected: _selectedIndex == 0,
                    width: widthBody * 0.3, // Adjust width as needed
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
                    title: "Nhóm của bạn",
                    isSelected: _selectedIndex == 1,
                    width: widthBody * 0.35, // Adjust width as needed
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 1;
                        widget.navigateTo(1); // Notify parent widget
                      });
                    },
                  ),
                  const SizedBox(width: 15), // 15px spacing
                  CustomTabBar2(
                    title: "Quản lý",
                    isSelected: _selectedIndex == 2,
                    width: widthBody * 0.2,
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
                    title: "Sự kiện",
                    isSelected: _selectedIndex == 3,
                    width: widthBody * 0.2,
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 3;
                        widget.navigateTo(3); // Notify parent widget
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
