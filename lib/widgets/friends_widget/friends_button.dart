import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  late IconData icon;
  late String text;

  CustomButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthSizedBox = MediaQuery.of(context).size.width * 0.032;
    double height = MediaQuery.of(context).size.height * 0.058;

    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.bottomLeft,
        height: height,
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
            ),
            SizedBox(width: widthSizedBox),
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
