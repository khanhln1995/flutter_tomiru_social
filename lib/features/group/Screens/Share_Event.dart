import 'package:flutter/material.dart';
import "package:tomiru_social_flutter/features/group/Screens/Event_Test.dart";
import "package:tomiru_social_flutter/features/group/Widgets/square_button.dart";
import "package:tomiru_social_flutter/common/widgets/friends2_widget/friends_button.dart";
import "share_event_components/infor2.dart";
import "share_event_components/button2.dart";
import "share_event_components/posting2.dart";
import "share_event_components/post_item2.dart";
import "share_event_components/header_group2.dart";
import "package:tomiru_social_flutter/features/Friends/Widgets/Open_Bottom_Sheet.dart";
import "../../Friends/Widgets/Body_Bottom_Sheet_Sort.dart";

class ShareEvent extends StatefulWidget {
  final bool isAdmin;
  const ShareEvent({super.key, required this.isAdmin});

  @override
  State<ShareEvent> createState() => _ShareEventState();
}

class _ShareEventState extends State<ShareEvent> {
  bool isJoined = false;
  void isJoinGroup(bool value) {
    setState(() {
      isJoined = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderGroup2(),
            Button2(
              isJoined: isJoined,
              isJoinGroup: isJoinGroup,
              isAdmin: widget.isAdmin,
            ),
            if (!isJoined)
              Infor2(
                isAdmin: widget.isAdmin,
              ),
            if (!isJoined)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[200],
                ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Bài viết",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Posting2(),
            Divider(
              thickness: 6,
              color: Colors.grey[200],
            ),
            // PostCategories2(),
            PostItem2(),
            GestureDetector(
              onLongPress: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16.0)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // ListTile(
                        //   leading: Image.asset("assets/images/Group 13114.png"),
                        //   title: Text(
                        //     'Bỏ theo dõi nhóm',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15,
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     // Handle the action
                        //   },
                        // ),
                        ListTile(
                          leading: Image.asset(
                            "assets/images/pushpin 1.png",
                            width: 24,
                            height: 24,
                          ),
                          title: const Text(
                            'Ghim vào phần Đáng chú ý trong nhóm',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Handle the action
                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/images/Group 10277.png"),
                          title: const Text(
                            'Chỉnh sửa',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Handle the action
                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/images/Group 13189.png"),
                          title: const Text(
                            'Sao chép',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Handle the action
                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/images/flag 1.png"),
                          title: const Text(
                            'Mời',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Handle the action
                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/images/log-out 1.png"),
                          title: const Text(
                            'Sao chép liên kết sự kiện',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Handle the action
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.65,
                child: EventTest(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Divider(
                thickness: 6,
                color: Colors.grey[200],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Tham gia cùng bạn bè",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                // Các widget khác của bạn
                Align(
                  alignment: Alignment
                      .bottomCenter, // Căn giữa theo chiều ngang, dưới cùng theo chiều dọc
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20.0), // Cách đáy 20px
                    child: Center(
                      child: SquareButton(
                        onPressed: () {},
                        buttonText: "Mời bạn bè",
                        buttonColor: const Color.fromARGB(197, 201, 201, 201),
                        textColor: const Color.fromARGB(255, 0, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
