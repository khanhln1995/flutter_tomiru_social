import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomAppbar extends StatelessWidget {
  final String title;
  final VoidCallback redirect;

  CustomAppbar({super.key, required this.title, required this.redirect});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: CustomAppColor.backgroundAppBar,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: size.width / 17,
          fontFamily: "Avenir",
        ),
      ),
      leading: IconButton(
        onPressed: redirect,
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          size: size.width / 17,
        ),
      ),
    );
  }
}
