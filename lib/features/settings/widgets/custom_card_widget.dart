import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomCard extends StatelessWidget {
  final IconData iconLeading;
  final String title;
  final Widget? trailing;
  final VoidCallback? action;

  const CustomCard(
      {super.key,
      required this.iconLeading,
      required this.title,
      this.trailing,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: CustomAppColor.backgroundListTile,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListTile(
        leading: Icon(iconLeading),
        title: Text(title),
        trailing: trailing,
        onTap: action,
      ),
    );
  }
}
