import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Color.dart'
    as CustomAppColor;

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 48.7,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_sharp, color: Colors.blue, size: 35),
          hintText: 'Tìm kiếm tin nhắn',
          hintStyle: TextStyle(
              fontSize: 19,
              fontFamily: "Avenir",
              color: CustomAppColor.hintText),
          filled: true,
          fillColor: CustomAppColor.backgroundTextField,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
