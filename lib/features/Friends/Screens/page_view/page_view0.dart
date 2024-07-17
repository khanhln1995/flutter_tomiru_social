import 'package:flutter/material.dart';

import '../../../../widgets/time_line/timeLine.dart';
import "../../../../widgets/friends2_widget/group_image.dart";


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
                   timeLine(),
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
