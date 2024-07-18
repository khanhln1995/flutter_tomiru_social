import 'package:flutter/material.dart';

class BoxButtomRight extends StatefulWidget {
  final data;
  const BoxButtomRight({Key? key, required this.data}) : super(key: key);

  @override
  State<BoxButtomRight> createState() => _BoxButtomRightState();
}

class _BoxButtomRightState extends State<BoxButtomRight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x80cccccc),
              ),
              child: Center(
                child: Icon(
                  Icons.thumb_up_off_alt_rounded,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          Text(
            '${widget.data['like']}',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x80cccccc),
              ),
              child: Center(
                child: Icon(
                  Icons.messenger_outlined,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          Text(
            '${widget.data['comment']}',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x80cccccc),
              ),
              child: Center(
                child: Icon(
                  Icons.polyline_rounded,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
          Text(
            '${widget.data['share']}',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 0),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Center(
                child: Icon(
                  Icons.more_horiz_sharp,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
