import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_inline_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_app_bar_chat_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class Chat extends StatefulWidget {
  final List listName;
  final int index;

  const Chat({super.key, required this.index, required this.listName});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarChat(
          imageLink: widget.listName[widget.index]['image'],
          name: widget.listName[widget.index]['title'],
          isActive: false,
          redirect: () => Navigator.pop(context),
          call: () {},
          callVideo: () {},
          height: size.height / 8.6,
        ),
        body: Column(
          children: [
            CustomInline(width: double.infinity),
            Expanded(flex: 9, child: Container()),
            Expanded(
                child: Container(
              color: CustomAppColor.backgroundTabBar,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.camera_fill),
                      color: CustomAppColor.cameraIcon),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.image_outlined),
                      color: CustomAppColor.cameraIcon),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.mic_fill),
                      color: CustomAppColor.cameraIcon),
                  SizedBox(
                    width: size.width * 0.533,
                    child: TextField(
                      scrollController: _scrollController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Nhập tin nhắn",
                        hintStyle: TextStyle(
                          color: CustomAppColor.textFieldChat,
                          fontSize: size.width / 30,
                        ),
                        contentPadding: EdgeInsets.only(
                            top: size.height / 50,
                            left: size.width / 30,
                            right: size.width / 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: CustomAppColor.textFieldChat,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: CustomAppColor.textFieldChat,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: CustomAppColor.textFieldChatSelected,
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        fillColor: CustomAppColor.backgroundTextField,
                      ),
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send_rounded),
                      color: CustomAppColor.cameraIcon),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
