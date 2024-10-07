import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String textButton;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.textButton,
    required this.width,
    required this.height,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
        ),
        child: Text(
          textButton,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.04,
            fontFamily: "Avenir",
          ),
        ),
      ),
    );
  }
}
