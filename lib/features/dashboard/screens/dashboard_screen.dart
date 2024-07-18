import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/Business_Screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/fund_screen.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/income_screen.dart';
import 'package:tomiru_social_flutter/features/Home_Screen/Screens/HomeScreen.dart';
import 'package:tomiru_social_flutter/features/Home_Social/Screens/Home.dart';

// import 'package:tomiru_social_flutter/features/cart/screens/cart_screen.dart';
// import 'package:tomiru_social_flutter/features/checkout/widgets/congratulation_dialogue.dart';
import 'package:tomiru_social_flutter/features/dashboard/widgets/registration_success_bottom_sheet.dart';
// import 'package:tomiru_social_flutter/features/home/screens/home_screen.dart';
// import 'package:tomiru_social_flutter/features/menu/screens/menu_screen.dart';
// import 'package:tomiru_social_flutter/features/order/controllers/order_controller.dart';
// import 'package:tomiru_social_flutter/features/order/screens/order_screen.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
// import 'package:tomiru_social_flutter/features/order/domain/models/order_model.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/controllers/dashboard_controller.dart';

import 'package:tomiru_social_flutter/features/dashboard/widgets/bottom_nav_item.dart';
import 'package:tomiru_social_flutter/features/update/screens/update_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/wallet_screen.dart';
import "package:tomiru_social_flutter/features/group_screen/screens/Group_Page.dart";
import 'package:tomiru_social_flutter/features/wallet/screens/wallet_screen_ui.dart';
// import 'package:tomiru_social_flutter/features/favourite/screens/favourite_screen.dart';
// import 'package:tomiru_social_flutter/features/loyalty/controllers/loyalty_controller.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
// import 'package:tomiru_social_flutter/common/widgets/cart_widget.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_dialog_widget.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  final bool fromSplash;
  const DashboardScreen(
      {super.key, required this.pageIndex, this.fromSplash = false});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;
  late bool _isLogin;
  bool active = false;

  get notificationBody => null;

  @override
  void initState() {
    super.initState();

    // _isLogin = Get.find<AuthController>().isLoggedIn();
    _isLogin = true;

    _showRegistrationSuccessBottomSheet();

    // if (_isLogin) {
    //   if (Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 &&
    //       Get.find<LoyaltyController>().getEarningPint().isNotEmpty &&
    //       !ResponsiveHelper.isDesktop(Get.context)) {
    //     Future.delayed(const Duration(seconds: 1),
    //         () => showAnimatedDialog(context, const CongratulationDialogue()));
    //   }
    //   _suggestAddressBottomSheet();
    //   Get.find<OrderController>().getRunningOrders(1, notify: false);
    // }

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      // const Text(" 123456567"),
      const Text(" 123456567"),
      const WalletScreenUi(),

      const Text(" 2"),
      // const Text(" 3"),
      const UpdateScreen(isUpdate: true),
      const GroupPage(),
      // const ChatScreen(notificationBody: notificationBody, user: user)
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  _showRegistrationSuccessBottomSheet() {
    bool canShowBottomSheet =
        Get.find<DashboardController>().getRegistrationSuccessfulSharedPref();
    if (canShowBottomSheet) {
      Future.delayed(const Duration(seconds: 1), () {
        ResponsiveHelper.isDesktop(context)
            ? Get.dialog(const Dialog(child: RegistrationSuccessBottomSheet()))
                .then((value) {
                Get.find<DashboardController>()
                    .saveRegistrationSuccessfulSharedPref(false);
                Get.find<DashboardController>()
                    .saveIsRestaurantRegistrationSharedPref(false);
                setState(() {});
              })
            : showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (con) => const RegistrationSuccessBottomSheet(),
              ).then((value) {
                Get.find<DashboardController>()
                    .saveRegistrationSuccessfulSharedPref(false);
                Get.find<DashboardController>()
                    .saveIsRestaurantRegistrationSharedPref(false);
                setState(() {});
              });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvoked: (val) {
        debugPrint('$_canExit');
        if (_pageIndex != 0) {
          _setPage(0);
        } else {
          if (_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('back_press_again_to_exit',
                style: TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(Dimensions.paddingSizeSmall),
          ));
          _canExit = true;

          Timer(const Duration(seconds: 2), () {
            _canExit = false;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            child: Row(children: [
              BottomNavItem(
                  iconData: Icons.home,
                  isSelected: _pageIndex == 0,
                  onTap: () => {_setPage(0)}),
              BottomNavItem(
                  iconData: Icons.favorite,
                  isSelected: _pageIndex == 1,
                  onTap: () => _setPage(1)),
              BottomNavItem(
                  iconData: Icons.access_alarm,
                  isSelected: _pageIndex == 2,
                  onTap: () => _setPage(2)),
              BottomNavItem(
                  iconData: Icons.shopping_bag,
                  isSelected: _pageIndex == 3,
                  onTap: () => _setPage(3)),
              BottomNavItem(
                  iconData: Icons.menu,
                  isSelected: _pageIndex == 4,
                  onTap: () => _setPage(4)),
            ]),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    print("pageIndex: $pageIndex");
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
