import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/fund_screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/income_screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/membership_package.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/net_screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/business_appbar.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/business_bottom_navbar.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Screen.dart';
import 'package:tomiru_social_flutter/features/Friends/Screens/Friend_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Page.dart';
import 'package:tomiru_social_flutter/features/Profile-social/Screens/Profile_Screen.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/state/home_controller.dart';
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
      Get.find<HomeController>().setPageIndex(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: 'Kinh doanh',
        padding: 0,
        widget: [
          CustomIcon(
              icon: Image.asset("assets/images/qr 1.png"),
              quantity: null,
              onPressed: () {}),
          CustomIcon(
              icon: Image.asset("assets/images/message.png"),
              quantity: 1,
              onPressed: () {}),
          CustomIcon(
              icon: Image.asset("assets/images/notification.png"),
              quantity: 2,
              onPressed: () {}),
          SizedBox(width: 12.0)
        ],
      ),
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            child: _body(),
          ),
        ],
      ),
      bottomNavigationBar:  BottomNavBar(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Obx(() {
        final pageIndex = Get.find<HomeController>().pageIndex.value;
        return getPage(pageIndex);
      }),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return NetScreen();
      case 1:
        return FundScreen();
      case 2:
        return IncomeScreen();
      case 3:
        return MembershipPackage();
      default:
        return FeedPage(scaffoldKey: _scaffoldKey);
    }
  }
}
