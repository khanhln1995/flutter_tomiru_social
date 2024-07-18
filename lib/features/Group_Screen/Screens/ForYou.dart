import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tomiru_social_flutter/widgets/friends2_widget/group_image.dart';
import 'package:tomiru_social_flutter/widgets/global/time_line/time_line.dart';


class ForYou extends StatefulWidget {
  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [          
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GroupImageList(),
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