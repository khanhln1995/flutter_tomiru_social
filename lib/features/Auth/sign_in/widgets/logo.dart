import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo-tomiru.jpg', // replace with your logo image path
      height: 90,
      width: 104,
    );
  }
}
