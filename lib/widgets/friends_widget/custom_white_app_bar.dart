import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWhiteAppBar extends StatelessWidget {
  late String text;
  late Widget? backButton;
  late Widget body;

  CustomWhiteAppBar(
      {Key? key, required this.text, this.backButton, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.06;
    double appBarHeight = MediaQuery.of(context).size.width * 0.23;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AppBar(
            title: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: backButton,
            // IconButton(
            //   onPressed: () => Navigator.of(context).pop(),
            //   icon: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Container(
                color: Color.fromARGB(255, 233, 232, 232),
                height: 1.3,
              ),
            ),
          ),
        ),
        body: body,
      ),
    );
  }
}
