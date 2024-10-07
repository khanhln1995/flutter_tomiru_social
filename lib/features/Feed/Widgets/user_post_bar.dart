import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/create_new_feed.dart';
import 'package:tomiru_social_flutter/features/search/screens/search_page.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';

class UserPostBar extends StatefulWidget {
  const UserPostBar({super.key});

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
                                const CreatedFeed(),
                            // transitionsBuilder: (context, animation1, animtion2, child) {
                            //   return FadeTransition(opacity: animation1, child: child);
                            // },
                            transitionDuration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFDEDEDE))),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Đăng bài mới',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.image),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 238, 238),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search),
              ),
              onPressed: () => Get.toNamed(RouteHelper.getSearchRoute()),
            ),
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 238, 238),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.display_settings),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
