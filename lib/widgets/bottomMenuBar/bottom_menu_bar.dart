import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Nhật ký',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection),
          label: 'Short',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Khám phá',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Bạn bè',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Nhóm',
        ),
      ],
      currentIndex: _currentIndex,
      iconSize: 28.0,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey[400],
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}
