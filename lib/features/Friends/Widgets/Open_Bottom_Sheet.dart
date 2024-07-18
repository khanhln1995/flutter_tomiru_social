import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void OpenBottomSheet(BuildContext context, Widget header, Widget body) {
  double horizontalBody = MediaQuery.of(context).size.width * 0.055;
  double paddingTopBody = MediaQuery.of(context).size.height * 0.015;
  double paddingBottomBody = MediaQuery.of(context).size.height * 0.035;
  double bottomHeader = MediaQuery.of(context).size.height * 0.007;
  double topBody = MediaQuery.of(context).size.height * 0.01;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    scrollControlDisabledMaxHeightRatio: 0.8,
    builder: (context) => IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(
            left: horizontalBody,
            right: horizontalBody,
            top: paddingTopBody,
            bottom: paddingBottomBody),
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.only(bottom: bottomHeader),
                child: header,
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 219, 217, 217),
              height: 1,
              width: double.infinity,
            ),
            IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.only(top: topBody),
                child: body,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
