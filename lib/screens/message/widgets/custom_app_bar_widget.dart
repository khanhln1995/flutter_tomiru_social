import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final VoidCallback redirect;

  CustomAppbar({super.key, required this.title, required this.redirect});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: "Avenir",
        ),
      ),
      leading: IconButton(
        onPressed: redirect,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
      ),
    );
  }
}
