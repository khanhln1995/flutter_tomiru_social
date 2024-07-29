import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/user_post_bar.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/custom_loader.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/emptyList.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_appbar2.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/hashtag_list.dart';
import 'package:tomiru_social_flutter/features/discovery/widgets/streaming_members.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/hot_videos.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/around_user.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/incoming_event.dart';

class BodyDiscoveryPage extends StatefulWidget {
  const BodyDiscoveryPage({super.key});

  @override
  State<BodyDiscoveryPage> createState() => _BodyDiscoveryPageState();
}

class _BodyDiscoveryPageState extends State<BodyDiscoveryPage> {
  int _selectedIndex = 0; // Track the selected tab index

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List? list = [];
    return CustomScrollView(
      slivers: <Widget>[
        list == null
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 135,
                  child: const CustomScreenLoader(
                    height: double.infinity,
                    width: double.infinity,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : list.isNotEmpty
                ? const SliverToBoxAdapter(
                    child: EmptyList(
                      'No Tweet added yet',
                      subTitle:
                          'When new Tweet added, they\'ll show up here \n Tap tweet button to add new',
                    ),
                  )
                : SliverToBoxAdapter(
                    child: _home(),
                  ),
      ],
    );
  }

  Widget _home() {
    return Column(
      children: [
        const SizedBox(height: 5),
        const UserPostBar(),
        discoveryBar(),
        const SizedBox(height: 5),
        if (_selectedIndex == 0) HashtagListScreen(),
        if (_selectedIndex == 1) StreamingMembers(),
        if (_selectedIndex != 2) const SizedBox(height: 5),
        HotVideos(index: _selectedIndex),
        const SizedBox(height: 5),
        if (_selectedIndex == 0) IncomingEvent(),
        if (_selectedIndex == 0) const SizedBox(height: 5),
        AroundUser(),
      ],
    );
  }

  Widget discoveryBar() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 0, 24.0),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // Set a fixed width
          child: Row(children: tabBarItems()),
        ),
      ),
    );
  }

  List<Widget> tabBarItems() {
    double tabBarHeight = MediaQuery.of(context).size.width * 0.075;
    return [
      Expanded(
        child: _buildTabBarItem("Dành cho bạn", 0, tabBarHeight),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: _buildTabBarItem("Trực tiếp", 1, tabBarHeight),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: _buildTabBarItem("Xu hướng", 2, tabBarHeight),
      ),
    ];
  }

  Widget _buildTabBarItem(String title, int index, double height) {
    return CustomTabBar2(
      title: title,
      isSelected: _selectedIndex == index,
      width: double.infinity,
      height: height,
      action: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
