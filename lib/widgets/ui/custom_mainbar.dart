import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Function onBackPress;
  final List<Widget>? widget;
  final IconData? icon;
  final String? image;
  final double? padding;
  const CustomAppBar(
      {this.titleText, required this.onBackPress, this.widget, this.icon, this.image, this.padding});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight * 1.4),
      child: ClipRRect(
        child: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: kToolbarHeight * 1.4,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),  
          leading: Container(
            padding: EdgeInsets.only(left: padding ?? 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: image != null && image!.isNotEmpty
                      ? Image.asset(image!)
                      : Icon(icon ?? Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => onBackPress(),
                ),
                if (titleText != null && titleText!.isNotEmpty)
                  Text(titleText!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          leadingWidth: MediaQuery.of(context).size.width / 2,
          actions: widget,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6.0),
            child: Container(
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.4);
}