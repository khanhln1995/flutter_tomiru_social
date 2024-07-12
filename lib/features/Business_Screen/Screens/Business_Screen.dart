import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/net_screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/business_appbar.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/business_bottom_navbar.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Screen.dart';
import 'package:tomiru_social_flutter/features/Friends/Screens/Friend_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Page.dart';
import 'package:tomiru_social_flutter/features/Profile/Screens/Profile_Screen.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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
      backgroundColor: Colors.white,
      appBar: BusinessAppBar(),
      key: _scaffoldKey,
      body: Column(
        children: [
          // dương đầu  b
          BottomNavBar(),
          Expanded(
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: getPage(Provider.of<AppState>(context).pageIndex),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return NetScreen();
      case 1:
        return ProfileScreen();
      case 2:
        return Friend2Screen();
      case 3:
        return Friend2Screen();
      default:
        return FeedPage(scaffoldKey: _scaffoldKey);
    }
  }
}
