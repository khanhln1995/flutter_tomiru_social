import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final bool isEnabled;
  final VoidCallback action;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final RoundedRectangleBorder? borderShape;
  final double? width;
  final double? height;
  final padding;

  CustomButton({
    required this.content,
    required this.isEnabled,
    required this.action,
    this.backgroundColor,
    this.textStyle,
    this.borderShape,
    this.width,
    this.height,
    this.padding = 23.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? action : null,
      child: Text(
        content,
        style: textStyle ??
            TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(borderShape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled))
            return Color.fromARGB(255, 219, 216, 216);
          return backgroundColor ?? Color(0xFFFFD200);
        }),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: padding, vertical: 4.0)),
        minimumSize:
            MaterialStateProperty.all<Size>(Size(width ?? 88, height ?? 48)),
      ),
    );
  }
}
