import 'package:flutter/material.dart';

class PostStatusFriend extends StatelessWidget {
  const PostStatusFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double verticalPadding = MediaQuery.of(context).size.height * 0.024;
    double horizontalPadding = MediaQuery.of(context).size.width * 0.04;

    // Widget definitions (removed unused ones)
    Widget avatar() {
      double imageSize = widthBody * 0.12;
      return Container(
        width: imageSize,
        height: imageSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/mark-zuckerberg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget postButton() {
      double subtitleSize = widthBody * 0.035;
      double postButtonWidth = widthBody * 0.58;
      double postButtonHeight = widthBody * 0.14;

      return Container(
        width: postButtonWidth,
        height: postButtonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            side: const BorderSide(
              color: Color.fromARGB(255, 194, 193, 209),
              width: 0.3,
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bạn viết gì đi...",
              style: TextStyle(
                fontSize: subtitleSize,
                fontFamily: "Avenir",
                color: const Color.fromARGB(255, 194, 193, 209),
              ),
            ),
          ),
        ),
      );
    }

    Widget qrButton() {
      double qrIconSize = widthBody * 0.06;
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        child: ClipRect(
          child: Container(
            padding: EdgeInsets.all(8),
            // width: qrIconSize,
            // height: qrIconSize,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(Icons.sort, size: 30, color: Colors.black),
          ),
        ),
      );
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double height = constraints.maxHeight;
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        width: widthBody,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            avatar(),
            postButton(),
            qrButton(),
          ],
        ),
      );
    });
  }
}
