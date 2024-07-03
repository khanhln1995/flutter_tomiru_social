import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/bottomMenuBar/bottom_menu_bar.dart';
import 'package:tomiru_social_flutter/screens/feed/feedPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: getPage(0),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return FeedPage(
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
      default:
        return FeedPage(scaffoldKey: _scaffoldKey);
    }
  }
}
