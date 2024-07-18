import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/features/Friends/Screens/Friend_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Page.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Screens/Profile_Screen.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';

import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/bottom_menu_bar.dart';
// import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Screen.dart';
import 'package:tomiru_social_flutter/features/Home/Screens/Social_page.dart'; 
import 'package:tomiru_social_flutter/features/discovery/screens/discovery_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<AppState>(context, listen: false);
      state.setPageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
      bottomNavigationBar: const BottomMenubar(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: getPage(Provider.of<AppState>(context).pageIndex),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        // return FeedPage(
        //   scaffoldKey: _scaffoldKey,
        //   refreshIndicatorKey: refreshIndicatorKey,
        // );
        return SocialNetworkPage();
      case 1:
        return ProfileScreen();
      case 2:
        return DiscoveryPage();
      case 3:
        return Friend2Screen();
      case 4:
        return GroupPage();
      default:
        // return FeedPage(scaffoldKey: _scaffoldKey);
        return SocialNetworkPage();
    }
  }
}
