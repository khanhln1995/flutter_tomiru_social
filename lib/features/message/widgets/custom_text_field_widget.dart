import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.86,
      height: size.height / 20,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search,
              color: Colors.blue, size: size.width / 14),
          hintText: 'Tìm kiếm tin nhắn',
          hintStyle: TextStyle(
              fontSize: size.width / 25,
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
