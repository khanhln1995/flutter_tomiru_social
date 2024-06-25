import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String content;
  final Color textColor;
  final Color lineColor;
  final double fontSize;

  const DividerWithText({
    Key? key,
    required this.content,
    this.textColor = const Color(0xFF404040),
    this.lineColor = const Color(0xFF404040),
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 20), // Điều chỉnh khoảng cách ngang
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 1,
            color: lineColor, // Màu của đường kẻ
          ),
          Container(
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Màu nền để "xóa" một phần của đường kẻ
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10), // Khoảng cách của văn bản so với đường kẻ
              child: Text(
                content,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
