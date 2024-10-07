import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomGroupChatAvatar extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  final String image4;

  CustomGroupChatAvatar(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 9.05,
      height: size.width / 9.05,
      color: CustomAppColor.backgroundAvatarGroupChat,
      child: Stack(
        children: [
          Positioned(
            top: size.height / 41.5,
            left: size.width / 19.3,
            child: Container(
              padding: EdgeInsets.all(0.9),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image1,
                  width: size.width / 18.4,
                  height: size.height / 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 41.5,
            child: Container(
              padding: EdgeInsets.all(0.9),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image2,
                  width: size.width / 18.4,
                  height: size.height / 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width / 19.3,
            child: Container(
              padding: EdgeInsets.all(0.9),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image3,
                  width: size.width / 18.4,
                  height: size.height / 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.9),
            decoration: BoxDecoration(
              color: CustomAppColor.pictureFrame,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                image4,
                width: size.width / 18.4,
                height: size.height / 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
