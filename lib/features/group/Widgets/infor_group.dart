import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Screens/Infor_group_screen.dart';

class InforGroup extends StatefulWidget {
  final bool isAdmin;
  const InforGroup({super.key, required this.isAdmin});
  @override
  State<InforGroup> createState() => _InforGroupState();
}

class _InforGroupState extends State<InforGroup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      width: 382,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Work.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: const Text(
                'behance/rachelpodrez',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Home.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: const Text(
                '09121xxxx',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/share.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              title: const Text(
                'behance/rachelpodrez',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: Image.asset(
                "assets/images/Info Square.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InforGroupScreen(
                              isAdmin: widget.isAdmin,
                            )));
              },
              title: const Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Thêm thông tin về ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Tomiru_Team',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
