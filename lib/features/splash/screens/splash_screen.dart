import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tomiru_social_flutter/common/widgets_2/no_internet_screen_widget.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
// import 'package:tomiru_social_flutter/features/cart/controllers/cart_controller.dart';
// import 'package:tomiru_social_flutter/features/favourite/controllers/favourite_controller.dart';
import 'package:tomiru_social_flutter/features/notification/domain/models/notification_body_model.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/splash/domain/models/deep_link_body.dart';
// import 'package:tomiru_social_flutter/helper/address_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  final NotificationBodyModel? notificationBody;
  final DeepLinkBody? linkBody;
  const SplashScreen(
      {super.key, required this.notificationBody, required this.linkBody});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();
    bool firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? const SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? 'no_connection' : 'connected',
            textAlign: TextAlign.center,
          ),
        ));
        print("isNotConnected");
        if (!isNotConnected) {
          print("connected");
          _route();
        }
      }
      firstTime = false;
    });

    Get.find<SplashController>().initSharedData();
    // if (AddressHelper.getAddressFromSharedPref() != null &&
    //     (AddressHelper.getAddressFromSharedPref()!.zoneIds == null ||
    //         AddressHelper.getAddressFromSharedPref()!.zoneData == null)) {
    //   AddressHelper.clearAddressFromSharedPref();
    // }
    // if (Get.find<AuthController>().isGuestLoggedIn() ||
    //     Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<CartController>().getCartDataOnline();
    // }
    print('initState splash');
    print('initState splash');
    print('initState splash');
    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    print("splash screen : ");
    Get.find<SplashController>().getConfigData().then((isSuccess) {
      if (isSuccess) {
        if (Get.find<SplashController>().showIntro()!) {
          _newlyRegisteredRouteProcess();
        } else {
          Get.offNamed(RouteHelper.getSignInRoute("sign-in"));
        }

        Timer(const Duration(seconds: 1), () async {
          double? minimumVersion = 0;
          // check version app
          // if (GetPlatform.isAndroid) {
          //   minimumVersion = Get.find<SplashController>()
          //       .configModel!
          //       .appMinimumVersionAndroid;
          // } else if (GetPlatform.isIOS) {
          //   minimumVersion =
          //       Get.find<SplashController>().configModel!.appMinimumVersionIos;
          // }
          // if (AppConstants.appVersion < minimumVersion ||
          //     Get.find<SplashController>().configModel!.maintenanceMode!) {
          //   Get.offNamed(RouteHelper.getUpdateRoute(
          //       AppConstants.appVersion < minimumVersion));
          // } else {
          //   if (widget.notificationBody != null && widget.linkBody == null) {
          //     _forNotificationRouteProcess();
          //   } else {
          //     if (Get.find<AuthController>().isLoggedIn()) {
          //       _forLoggedInUserRouteProcess();
          //     } else {
          //       if (Get.find<SplashController>().showIntro()!) {
          //         _newlyRegisteredRouteProcess();
          //       } else {
          //         if (Get.find<AuthController>().isGuestLoggedIn()) {
          //           // _forGuestUserRouteProcess();
          //         } else {
          //           // await Get.find<AuthController>().guestLogin();
          //           // _forGuestUserRouteProcess();
          //         }
          //       }
          //     }
          //   }
          // }
        });
      }
    });
  }

  void _forNotificationRouteProcess() {
    if (widget.notificationBody!.notificationType == NotificationType.order) {
      Get.offNamed(
          RouteHelper.getOrderDetailsRoute(widget.notificationBody!.orderId));
    } else if (widget.notificationBody!.notificationType ==
        NotificationType.general) {
      Get.offNamed(RouteHelper.getNotificationRoute(fromNotification: true));
    } else {
      Get.offNamed(RouteHelper.getChatRoute(
          notificationBody: widget.notificationBody,
          conversationID: widget.notificationBody!.conversationId));
    }
  }

  Future<void> _forLoggedInUserRouteProcess() async {
    Get.find<AuthController>().updateToken();
    // await Get.find<FavouriteController>().getFavouriteList();
    // if (AddressHelper.getAddressFromSharedPref() != null) {
    //   Get.offNamed(RouteHelper.getInitialRoute(fromSplash: true));
    // } else {
    // }
    Get.offNamed(RouteHelper.getAccessLocationRoute('splash'));
  }

  void _newlyRegisteredRouteProcess() {
    if (AppConstants.languages.length > 1) {
      Get.offNamed(RouteHelper.getLanguageRoute('splash'));
    } else {
      Get.offNamed(RouteHelper.getOnBoardingRoute());
    }
  }

  // void _forGuestUserRouteProcess() {
  //   if (AddressHelper.getAddressFromSharedPref() != null) {
  //     Get.offNamed(RouteHelper.getInitialRoute(fromSplash: true));
  //   } else {
  //     Get.find<SplashController>()
  //         .navigateToLocationScreen('splash', offNamed: true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: GetBuilder<SplashController>(builder: (splashController) {
        return Center(
          child: splashController.hasConnection
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Images.logo, width: 100),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    Image.asset(Images.logoName, width: 150),

                    /*SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: 25)),*/
                  ],
                )
              : NoInternetScreen(
                  child: SplashScreen(
                      notificationBody: widget.notificationBody,
                      linkBody: widget.linkBody)),
        );
      }),
    );
  }
}
