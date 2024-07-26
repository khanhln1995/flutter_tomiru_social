import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomAppBarChat extends StatelessWidget implements PreferredSizeWidget {
  final String imageLink;
  final String name;
  final bool isActive;
  final VoidCallback redirect;
  final VoidCallback call;
  final VoidCallback callVideo;
  final double height;

  CustomAppBarChat(
      {super.key,
      required this.imageLink,
      required this.name,
      required this.isActive,
      required this.redirect,
      this.height = kToolbarHeight,
      required this.call,
      required this.callVideo});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> characters =
        name.runes.map((rune) => String.fromCharCode(rune)).toList();
    if (characters.length > 19) {
      characters.replaceRange(19, (characters.length - 1), ['.', '.', '.']);
    }
    String modifiedString = characters.join('');

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        width: double.infinity,
        color: CustomAppColor.backgroundAppBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: redirect,
              icon: Icon(
                Icons.arrow_back_ios,
                size: size.width / 18,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 2),
              width: size.width * 0.648,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: size.width / 8.5),
                    child: ClipOval(
                      child: Image.network(
                        imageLink,
                        width: size.width / 8.1,
                        height: size.width / 8.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 8.2),
                    child: Expanded(
                      child: characters.length <= 21
                          ? Text(
                              name,
                              style: TextStyle(
                                fontSize: size.width / 20,
                                fontFamily: "Avenir",
                              ),
                            )
                          : Text(
                              modifiedString,
                              style: TextStyle(
                                fontSize: size.width / 23,
                                fontFamily: "Avenir",
                              ),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width / 8),
                    child: isActive
                        ? Text("• Đang hoạt động",
                            style: TextStyle(
                                fontSize: size.width / 35,
                                fontFamily: "Avenir",
                                color: CustomAppColor.isActive))
                        : Text("• Offline 10 năm trước",
                            style: TextStyle(
                                fontSize: size.width / 35,
                                fontFamily: "Avenir",
                                color: CustomAppColor.isNotActive)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: call,
                  icon: Icon(
                    CupertinoIcons.phone_fill,
                    size: size.width / 16,
                    color: CustomAppColor.phoneIcon,
                  ),
                ),
                IconButton(
                  onPressed: callVideo,
                  icon: Icon(
                    CupertinoIcons.videocam_fill,
                    size: size.width / 16,
                    color: CustomAppColor.cameraIcon,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
