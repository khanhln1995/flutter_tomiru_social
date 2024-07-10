import 'package:flutter/material.dart';
import '../../../widgets/global/timeLine/timeLine.dart';
import "../../../widgets/friends2_widget/group_image.dart";

class ForYou extends StatefulWidget {
  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
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
                   TimeLine(),
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
