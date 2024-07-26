import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_nhomchat/page_view4.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_nhomchat/page_view5.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_nhomchat/page_view6.dart';
//
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_trochuyen/pageview1.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_trochuyen/pageview2.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_page/pageview_trochuyen/pageview3.dart';
import 'package:tomiru_social_flutter/features/message_app/widgets/message_bar.dart';

class BodyMessage extends StatefulWidget {
  @override
  _BodyMessageState createState() => _BodyMessageState();
}

class _BodyMessageState extends State<BodyMessage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                  'Cuộc trò chuyện'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text('Nhóm chat'.tr, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeTab(),
                SettingsTab(),
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
          MessageBar(navigateTo: _navigateTo),
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
    PageView4(),
    PageView5(),
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
          MessageBar(navigateTo: _navigateTo),
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
