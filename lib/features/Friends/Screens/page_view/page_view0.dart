import 'package:flutter/material.dart';
import "../../../../common/widgets/friends2_widget/group_image.dart";
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';

class PageView0 extends StatefulWidget {
  @override
  State<PageView0> createState() => _PageView0State();
}

class _PageView0State extends State<PageView0> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // GroupImageList(),
                  //  TimeLine(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
