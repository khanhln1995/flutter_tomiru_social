import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/new_message.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_appbar2.dart';

class MessageBar2 extends StatefulWidget {
  final Function(int) navigateTo;

  const MessageBar2({super.key, required this.navigateTo});

  @override
  State<MessageBar2> createState() => _MessageBar2State();
}

class _MessageBar2State extends State<MessageBar2> {
  int _selectedIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double tabBarHeight = widthBody * 0.07;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
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
                    title: "Tất cả".tr,
                    isSelected: _selectedIndex == 0,
                    width: widthBody * 0.2, // Adjust width as needed
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 0;
                        widget.navigateTo(0); // Notify parent widget
                      });
                    },
                  ),
                  const SizedBox(width: 10), // 10px spacing
                  CustomTabBar2(
                    title: "Online".tr,
                    isSelected: _selectedIndex == 1,
                    width: widthBody * 0.2, // Adjust width as needed
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 1;
                        widget.navigateTo(1); // Notify parent widget
                      });
                    },
                  ),
                  const SizedBox(width: 10), // 10px spacing
                  CustomTabBar2(
                    title: "Mới".tr,
                    isSelected: _selectedIndex == 2,
                    width: widthBody * 0.15,
                    height: tabBarHeight,
                    action: () {
                      setState(() {
                        _selectedIndex = 2;
                        widget.navigateTo(2); // Notify parent widget
                      });
                    },
                  ),
                  const SizedBox(width: 10), // 10px spacing
                  CustomTabBar2(
                    title: "Chờ kết bạn".tr,
                    isSelected: _selectedIndex == 3,
                    width: widthBody * 0.3,
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
