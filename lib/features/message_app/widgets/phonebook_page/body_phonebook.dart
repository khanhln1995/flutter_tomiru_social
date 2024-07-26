
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_banbe/pageview_1.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_banbe/pageview_2.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_banbe/pageview_3.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_banbe/pageview_4.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_danhbamay/pageview_5.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/phonebook_page/pageview_loimoi/pageview_6.dart';

import 'package:tomiru_social_flutter/features/message_app/widgets/message_bar2.dart';

class BodyPhonebook extends StatefulWidget {
  @override
  _BodyPhonebookState createState() => _BodyPhonebookState();
}

class _BodyPhonebookState extends State<BodyPhonebook>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set white background color
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: const Color.fromARGB(255, 53, 162, 251),
            dividerColor: const Color.fromARGB(255, 215, 215, 215),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
            tabs: [
              Tab(
                child: Text(
                  'Bạn bè'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text('Lời mời'.tr, style: TextStyle(fontSize: 16)),
              ),
              Tab(
                child: Text('Danh bạ máy'.tr, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeTab(),
                SettingsTab(),
                SettingsTab2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  final int initialPageIndex;
  const HomeTab({Key? key, this.initialPageIndex = 0}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _innerPageIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _innerPageIndex = index;
    });
  }

  final List<Widget> _innerPages = [
    PageView1(),
    PageView2(),
    PageView3(),
    PageView4(),
    // EventExist()
    // timeLine(),
    // Add more pages if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set white background color
      body: Column(
        children: [
          MessageBar2(navigateTo: _navigateTo),
          Expanded(
            child: IndexedStack(
              index: _innerPageIndex,
              children: _innerPages,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTab extends StatefulWidget {
  final int initialPageIndex;
  const SettingsTab({Key? key, this.initialPageIndex = 0}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  int _innerPageIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _innerPageIndex = index;
    });
  }

  final List<Widget> _innerPages = [
   PageView5(),
    // PageView5(),
    // PageView6(),
    // EventExist()
    // timeLine(),
    // Add more pages if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set white background color
      body: Column(
        children: [
          
          Expanded(
            child: IndexedStack(
              index: _innerPageIndex,
              children: _innerPages,
            ),
          ),
        ],
      ),
    );
  }
}
class SettingsTab2 extends StatefulWidget {
  final int initialPageIndex;
  const SettingsTab2({Key? key, this.initialPageIndex = 0}) : super(key: key);

  @override
  State<SettingsTab2> createState() => _SettingsTab2State();
}

class _SettingsTab2State extends State<SettingsTab2> {
  int _innerPageIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _innerPageIndex = index;
    });
  }

  final List<Widget> _innerPages = [
    // PageView4(),
    // PageView5(),
    PageView6(),
    // EventExist()
    // timeLine(),
    // Add more pages if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set white background color
      body: Column(
        children: [
          
          Expanded(
            child: IndexedStack(
              index: _innerPageIndex,
              children: _innerPages,
            ),
          ),
        ],
      ),
    );
  }
}
