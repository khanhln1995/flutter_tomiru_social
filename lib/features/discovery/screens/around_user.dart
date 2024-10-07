import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';

class AroundUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text('Xung quanh bạn',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        // TimeLine()
      ],
    );
  }
}
