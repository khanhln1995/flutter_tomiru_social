import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/new_message.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_appbar2.dart';

class MessageBar extends StatefulWidget {
  final Function(int) navigateTo;

  const MessageBar({super.key, required this.navigateTo});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
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
                  const SizedBox(width: 15), // 15px spacing
                  CustomTabBar2(
                    title: "Chờ phản hồi".tr,
                    isSelected: _selectedIndex == 1,
                    width: widthBody * 0.3, // Adjust width as needed
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
                    title: "Riêng tư".tr,
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
                  const SizedBox(width: 25), // 25px spacing
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Positioned(
                                top: MediaQuery.of(context).size.height *
                                    0.175, // Adjust this value as needed
                                left: MediaQuery.of(context).size.width * 0.25,
                                right: 0,
                                child: Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5, // Chiều cao của Container
                                      width: MediaQuery.of(context).size.width /
                                          3, // Chiều rộng của Container
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly, // Căn đều các dòng theo chiều dọc
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // Căn giữa các dòng theo chiều ngang
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa các dòng theo chiều ngang
                                            children: [
                                              Icon(Icons.group_add, size: 24),
                                              SizedBox(width: 15),
                                              Text(
                                                'Tạo nhóm',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa các dòng theo chiều ngang
                                            children: [
                                              Icon(Icons.message, size: 24),
                                              SizedBox(width: 15),
                                              GestureDetector(
                                                onTap:(){
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => const NewMessage()));
                                                },
                                                child: Text(
                                                  'Tin nhắn mới',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa các dòng theo chiều ngang
                                            children: [
                                              Icon(Icons.calendar_today,
                                                  size: 24),
                                              SizedBox(width: 15),
                                              Text(
                                                'Tạo lịch nhóm',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      FontAwesomeIcons.penToSquare,
                      size:
                          tabBarHeight, // Make the icon the same height as the tabs
                      color: Colors.black,
                    ),
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
