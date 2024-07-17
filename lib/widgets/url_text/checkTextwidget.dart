import 'package:flutter/material.dart';

//check chiều dài của text  truyền 2 tham số là text và độ dài muốn check
//nếu vượt quá độ dài sẽ hiện thị nút ấn xem thêm
//khi click vào nút ấn sẽ show toàn bộ nội dung
class TextWidget extends StatefulWidget {
  final String text;
  final int textLength;

  TextWidget({required this.text, this.textLength = 80});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayText = isExpanded
        ? widget.text
        : widget.text.length > widget.textLength
            ? widget.text.substring(0, widget.textLength) + '...xem thêm'
            : widget.text;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Text(
        displayText,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
