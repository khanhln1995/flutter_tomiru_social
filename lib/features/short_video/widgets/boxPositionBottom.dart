import 'package:flutter/material.dart';

import "package:tomiru_social_flutter/common/widgets/build_avatar_widget.dart";
import "package:tomiru_social_flutter/common/widgets/url_text/checkTextwidget.dart";
class BoxPositionBottom extends StatefulWidget {
  final data;
  const BoxPositionBottom({Key? key, required this.data}) : super(key: key);

  @override
  State<BoxPositionBottom> createState() => _BoxPositionBottomState();
}

class _BoxPositionBottomState extends State<BoxPositionBottom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: _boxContent(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Thêm bình luận',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _boxContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BuildAvatarWidget(
                urlAvatar: widget.data['avatar'],
                width: 40,
                height: 40,
              ),
              SizedBox(width: 10),
              Text(
                widget.data['userName'],
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextWidget(
            text: widget.data['content'],
            textLength: 25,
          ),
          Text(
            '#${widget.data['tag']}',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
            decoration: BoxDecoration(
              color: const Color(0x80cccccc),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 3),
                  Text(
                    '${widget.data['music']} - @${widget.data['singer']}',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
