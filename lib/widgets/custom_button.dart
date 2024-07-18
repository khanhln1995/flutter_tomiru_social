import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final bool isEnabled;
  final VoidCallback action;
  final Color? backgroundColor;
  final TextStyle? textStyle;
   final FontWeight? fontWeight;
  final Color? textColor;
  final RoundedRectangleBorder? borderShape;
  final double? width;
  final double? height;
  final padding;

  const CustomButton({
    required this.content,
    required this.isEnabled,
    required this.action,
    this.backgroundColor,
    this.textStyle,
    this.fontWeight,
    this.textColor,
    this.borderShape,
    this.width,
    this.height,
    this.padding = 23.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? action : null,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(borderShape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color.fromARGB(255, 219, 216, 216);
          }
          return backgroundColor ?? const Color(0xFFFFD200);
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: padding, vertical: 4.0)),
        minimumSize:
            WidgetStateProperty.all<Size>(Size(width ?? 88, height ?? 48)),
      ),
      child: Text(
        content,
        style: textStyle ??
             TextStyle(
                color: Colors.black ?? textColor  , fontSize: 16, fontWeight: FontWeight.bold ?? fontWeight  ),
      ),
    );
  }
}
