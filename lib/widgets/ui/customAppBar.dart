import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Function onBackPress;
  final Color? bgcolor;
  final Color? colors; // text and icon color
  final List<Widget>? widget;
  final IconData? icon;
  const CustomAppBar(
      {required this.titleText,
      required this.onBackPress,
      this.bgcolor,
      this.colors,
      this.widget,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: AppBar(
          backgroundColor: bgcolor ?? Color(0xFFFFD200),
          leading: IconButton(
            icon: Icon(icon ?? Icons.arrow_back_ios, color: colors ?? Colors.white),
            onPressed: () => onBackPress(),
          ),
          title: Text(
            titleText,
            style: TextStyle(
              color: colors ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: widget,
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
