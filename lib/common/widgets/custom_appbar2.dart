import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CustomTabBar2 extends StatelessWidget {
  late String title;
  late IconData? icon;
  late VoidCallback? action;
  late bool isSelected;
  // late bool isButtonInPost;
  late double width;
  late double height;

  CustomTabBar2(
      {Key? key,
      required this.title,
      this.icon,
      this.action,
      required this.isSelected,
      // required this.isButtonInPost,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingContainer = MediaQuery.of(context).size.width * 0.018;
    double textSize = MediaQuery.of(context).size.width * 0.038;
    double iconSize = MediaQuery.of(context).size.width * 0.055;
    double fontSize = MediaQuery.of(context).size.width * 0.035;
    double widthSizedBox = MediaQuery.of(context).size.width * 0.005;

    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingContainer),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? Color.fromRGBO(29, 155, 240, 1)
              : Color.fromARGB(255, 245, 244, 244),
        ),
        child: icon == null
            ? Center(
                child:
                    // isButtonInPost ?
                    Text(
                title,
                style: TextStyle(
                  fontSize: textSize,
                  fontFamily: "Avenir",
                  color: isSelected ? Colors.white : Colors.black,
                ),
              )
                // : Text(
                //     title,
                //     style: TextStyle(
                //       fontSize: textSize,
                //       fontFamily: "Avenir",
                //       color: isSelected
                //           ? Colors.white
                //           : Color.fromARGB(255, 134, 134, 134),
                //     ),
                //   ),
                )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: isSelected
                        ? Colors.white
                        : Color.fromARGB(255, 128, 127, 127),
                  ),
                  SizedBox(width: widthSizedBox),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: "Avenir",
                      color: isSelected
                          ? Colors.white
                          : Color.fromARGB(255, 134, 134, 134),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
