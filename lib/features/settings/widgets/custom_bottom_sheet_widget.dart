import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

void OpenBottomSheet(
    BuildContext context, Widget title, Widget buttonSave, Widget body) {
  Size size = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.03,
          top: size.height * 0.015,
          bottom: size.height * 0.035,
        ),
        width: double.infinity,
        height: size.height * 0.94,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: CustomAppColor.backgroundBottomSheet),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          size: size.width / 15,
                        )),
                    SizedBox(width: size.width * 0.13),
                    title,
                    SizedBox(width: size.width * 0.115),
                    buttonSave
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.03,
                  right: size.width * 0.03),
              child: body,
            ),
          ],
        ),
      ),
    ),
  );
}
