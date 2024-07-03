import 'package:flutter/material.dart';

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
        const CircleAvatar(
          backgroundImage: AssetImage(
            //fake data , changer widget.urlAvatar
            'assets/images/mark-zuckerberg.jpg',
          ),
          radius: 25,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFFFFD200))),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                ),
                border: const OutlineInputBorder(),
                hintText: 'Viết bình luận',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
