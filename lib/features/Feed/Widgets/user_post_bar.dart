import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Create_Feed_Screen.dart';

class UserPostBar extends StatefulWidget {
  const UserPostBar({Key? key}) : super(key: key);

  @override
  State<UserPostBar> createState() => _UserPostBarState();
}

class _UserPostBarState extends State<UserPostBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/kem.jpg',
              ),
              radius: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextField(
                      readOnly: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                CreatedFeed(),
                            // transitionsBuilder: (context, animation1, animtion2, child) {
                            //   return FadeTransition(opacity: animation1, child: child);
                            // },
                            transitionDuration: Duration(seconds: 1),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFFDEDEDE))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Đăng bài mới',
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.image),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 238, 238),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.search),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 238, 238),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.display_settings),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
