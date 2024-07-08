import 'package:flutter/material.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[100],
      pinned: true,
      floating: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      actions: [
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.home,
            index: 0,
            image: true,
            text: 'Mạng xã hội'),
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.storefront_outlined,
            index: 1,
            image: false,
            text: 'Chợ'),
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.supervised_user_circle_outlined,
            index: 2,
            image: false,
            text: 'Cộng đồng'),
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.notifications_active_outlined,
            index: 3,
            image: false,
            text: 'Thông báo'),
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.message_outlined,
            index: 4,
            image: false,
            text: 'Tin nhắn'),
        buildIconButton(
            // pageIndexNotifier: pageIndexNotifier,
            icon: Icons.person_pin,
            index: 5,
            image: false,
            text: 'Tài khoản'),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Firefly.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget buildIconButton({
    // required ValueNotifier<int> pageIndexNotifier,
    required IconData icon,
    required int index,
    bool? image,
    required String text,
  }) {
    return Expanded(
      child: ValueListenableBuilder<int>(
        valueListenable: ValueNotifier<int>(0),
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: value == index ? Color(0xff9F2424) : Colors.black,
                icon: image == true
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          value == index
                              ? 'assets/images/icon-tomiru-appbar-fill.jpg'
                              : 'assets/images/icon-tomiru-appbar.jpg',
                          fit: BoxFit.cover,
                          height: 40,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color:
                              value == index ? Color(0xffFFD200) : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon,
                            color: value == index
                                ? Color(0xff9F2424)
                                : Colors.black),
                      ),
                onPressed: () {
                  // pageIndexNotifier.value = index;
                },
              ),
              Text(
                text,
                style: TextStyle(
                    color: value == index ? Colors.blue : Colors.black,
                    fontSize: 10),
              ),
            ],
          );
        },
      ),
    );
  }
}
