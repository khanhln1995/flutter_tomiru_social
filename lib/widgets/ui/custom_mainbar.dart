import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? mainTitle;
  final String? titleText;
  final Function onBackPress;
  final List<Widget>? widget;
  final IconData? icon;
  final String? image;
  final double? padding;
  final double leadingWidth;
  const CustomAppBar(
      {super.key,
      this.titleText,
      this.mainTitle,
      required this.onBackPress,
      this.widget,
      this.icon,
      this.image,
      this.padding,
      this.leadingWidth = 0});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight * 1.4),
      child: ClipRRect(
        child: AppBar(
          title: Text(mainTitle ?? '',
              textAlign: TextAlign.center),
          centerTitle: true,
          scrolledUnderElevation: 0,
          toolbarHeight: kToolbarHeight * 1.4,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: Container(
            padding: EdgeInsets.only(left: padding ?? 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: image != null && image!.isNotEmpty
                      ? Image.asset(image!)
                      : Icon(icon ?? Icons.arrow_back_ios_new,
                          color: Colors.black),
                  onPressed: () => onBackPress(),
                ),
                if (titleText != null && titleText!.isNotEmpty)
                  Text(titleText!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          leadingWidth: (mainTitle == null || mainTitle!.isEmpty) &&
                  ((titleText != null && titleText!.isNotEmpty) ||
                      (image != null && image!.isNotEmpty))
              ? MediaQuery.of(context).size.width / 2
              : 56,
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
