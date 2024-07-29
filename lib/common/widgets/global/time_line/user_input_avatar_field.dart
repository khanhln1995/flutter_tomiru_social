import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/util/show_post_comments.dart';

class UserInputAvatarField extends StatefulWidget {
  final String urlAvatar;

  const UserInputAvatarField({
    Key? key,
    required this.urlAvatar,
  }) : super(key: key);

  @override
  State<UserInputAvatarField> createState() => _UserInputAvatarFieldState();
}

class _UserInputAvatarFieldState extends State<UserInputAvatarField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(
            //fake data , changer widget.urlAvatar
            'assets/images/kem.jpg',
          ),
          radius: 25,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              onTap: () {
                showUnderBottomSheet(context, 0);
              },
              readOnly: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFFFFD200))),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                ),
                border: OutlineInputBorder(),
                hintText: 'Viết bình luận',
                suffixIcon: Icon(Icons.tag_faces_outlined),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
