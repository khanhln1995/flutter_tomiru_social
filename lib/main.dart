import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
import 'package:tomiru_social_flutter/features/notification/domain/models/notification_body_model.dart';
import 'package:tomiru_social_flutter/features/short_video/controller/short_video_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/theme_controller.dart';
import 'package:tomiru_social_flutter/features/splash/domain/models/deep_link_body.dart';
import 'package:tomiru_social_flutter/helper/notification_helper.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/state/home_controller.dart';
import 'package:tomiru_social_flutter/theme/dark_theme.dart';
import 'package:tomiru_social_flutter/theme/light_theme.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:tomiru_social_flutter/util/messages.dart';
import "package:tomiru_social_flutter/state/message_controller.dart";
import 'helper/get_di.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
   Get.put(HomeController());
   Get.put(ShortVideoController());
   Get.put(AppState());
  WidgetsFlutterBinding.ensureInitialized();

  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DeepLinkBody? linkBody;
  NotificationBodyModel? body;

  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (remoteMessage != null) {
        body = NotificationHelper.convertNotification(remoteMessage.data);
      }
      await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  } catch (e) {
    print("Error initializing notifications: $e");
  }

  Map<String, Map<String, String>> languages = await di.init();
  // print("languages------$languages");
  // print("body------$body");
  // print("linkBody------$linkBody");

  runApp(MyApp(
    languages: languages,
    linkBody: linkBody ?? DeepLinkBody(),
    body: body ?? NotificationBodyModel(),
  ));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBodyModel? body;
  final DeepLinkBody? linkBody;
  const MyApp(
      {super.key,
      required this.languages,
      required this.body,
      required this.linkBody});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.find<LocalizationController>().saveLanguage(const Locale("vn", "VN"));
      Get.put(MessageController()); // Register MessageController

    _route();
  }

  Future<void> _route() async {
    // if (GetPlatform.isWeb) {
    //   Get.find<SplashController>().initSharedData();
    //   if (!Get.find<AuthController>().isLoggedIn() &&
    //       !Get.find<AuthController>()
    //           .isGuestLoggedIn() /*&& !ResponsiveHelper.isDesktop(Get.context!)*/) {
    //     await Get.find<AuthController>().guestLogin();
    //   }
    //   if (Get.find<AuthController>().isLoggedIn() ||
    //       Get.find<AuthController>().isGuestLoggedIn()) {
    //     Get.find<CartController>().getCartDataOnline();
    //   }
    // }
    // Get.find<SplashController>().getConfigData().then((bool isSuccess) async {
    //   if (isSuccess) {
    //     if (Get.find<AuthController>().isLoggedIn()) {
    //       Get.find<AuthController>().updateToken();
    //       // await Get.find<FavouriteController>().getFavouriteList();
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("build context");
    return GetBuilder<ThemeController>(builder: (themeController) {
      print("themeController");
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<SplashController>(builder: (splashController) {
          print(splashController.configModel);
          return (GetPlatform.isWeb && splashController.configModel == null)
              ? const SizedBox()
              : GetMaterialApp(
                  title: AppConstants.appName,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch
                    },
                  ),
                  theme: themeController.darkTheme ? dark : light,
                  // theme: dark,
                  locale: localizeController.locale,
                  translations: Messages(languages: widget.languages),
                  fallbackLocale: Locale(
                      AppConstants.languages[0].languageCode!,
                      AppConstants.languages[0].countryCode),
                  initialRoute:
                      // GetPlatform.isWeb
                      //     ? RouteHelper.getInitialRoute()
                      //     :
                      RouteHelper.getSplashRoute(widget.body, widget.linkBody),
                  getPages: RouteHelper.routes,
                  defaultTransition: Transition.topLevel,
                  transitionDuration: const Duration(milliseconds: 500),
                  builder: (BuildContext context, widget) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1)),
                      child: Material(
                          child: Stack(children: [
                        widget!,
                        GetBuilder<SplashController>(
                            builder: (splashController) {
                          // if (
                          //   !splashController.savedCookiesData ||
                          //     !splashController.getAcceptCookiesStatus(
                          //         splashController.configModel?.cookiesText ??
                          //             "")
                          //             ) {
                          //   return const SizedBox();
                          //   // ResponsiveHelper.isWeb()
                          //   //     ? const Align(
                          //   //         alignment: Alignment.bottomCenter,
                          //   //         child: CookiesViewWidget())
                          //   //     :
                          // } else {}
                          return const SizedBox();
                        })
                      ])),
                    );
                  });
        });
      });
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
