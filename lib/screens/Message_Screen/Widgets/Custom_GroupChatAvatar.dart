import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Color.dart'
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
    return Container(
      width: 45,
      height: 45,
      color: CustomAppColor.backgroundAvatarGroupChat,
      child: Stack(
        children: [
          Positioned(
            top: 21,
            left: 20.9,
            child: Container(
              padding: EdgeInsets.all(0.8),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image1,
                  width: 22.5,
                  height: 22.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 21,
            child: Container(
              padding: EdgeInsets.all(0.8),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image2,
                  width: 22.5,
                  height: 22.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.9,
            child: Container(
              padding: EdgeInsets.all(0.8),
              decoration: BoxDecoration(
                color: CustomAppColor.pictureFrame,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  image3,
                  width: 22.5,
                  height: 22.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.8),
            decoration: BoxDecoration(
              color: CustomAppColor.pictureFrame,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                image4,
                width: 22.5,
                height: 22.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
