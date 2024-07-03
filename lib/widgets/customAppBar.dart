import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Function onBackPress;
  final Color? bgcolor;
  final Color? colors; // text and icon color
  final List<Widget>? widget;
  const CustomAppBar({
    required this.titleText,
    required this.onBackPress,
    this.bgcolor,
    this.colors,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        child: AppBar(
          backgroundColor: bgcolor ?? Color.fromARGB(255, 255, 255, 255),
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: colors ?? Colors.white),
                onPressed: () => onBackPress(),
              ),
              Text(titleText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
            ],
          ),
          actions: widget,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
