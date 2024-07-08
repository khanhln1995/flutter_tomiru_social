import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double width;
  final FontWeight? fontWeight; // Sử dụng FontWeight? để cho phép null

  const SquareButton({
    required this.onPressed,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.black,
    this.width = 374,
    this.fontWeight, // Không cần giá trị mặc định
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          textStyle: TextStyle(fontSize: 16), // Loại bỏ fontWeight từ đây
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight, // Sử dụng fontWeight ở đây
            )),
      ),
    );
  }
}