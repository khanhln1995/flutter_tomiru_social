import 'package:flutter/material.dart';
class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 382,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Work.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Làm việc tại ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'TOMIRU',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Home.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Sống tại ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Hà Nội',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/share.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: Text(
                'behance/rachelpodrez',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Info Square.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Thêm thông tin về',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Tony Nguyen',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}