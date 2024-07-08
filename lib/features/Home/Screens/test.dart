import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/features/Feed_Screen/Screens/Feed_Screen.dart';
import 'package:tomiru_social_flutter/features/Friend2_Screen/Screens/Friend2_Screen.dart';
import 'package:tomiru_social_flutter/features/Profile_Screen/Screens/Profile_Screen.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/widgets/bottomMenuBar/bottom_menu_bar.dart';


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
      bottomNavigationBar: const BottomNavBar(),
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
    print('````````````````````````````````````````');
    print(Provider.of<AppState>(context).pageIndex);
    print('````````````````````````````````````````');
    switch (index) {
      case 0:
        return FeedPage(
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
      case 1:
        return ProfileScreen();
      case 2:
        return Friend2Screen();
      case 3:
        return ProfileScreen();
      case 4:
        return ProfileScreen();
      default:
        return FeedPage(scaffoldKey: _scaffoldKey);
    }
  }
}
