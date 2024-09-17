import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/profile/controllers/profile_controller.dart';
import 'package:tomiru_social_flutter/features/users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:weather/weather.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/wallet_info.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/contact_member.dart';
import 'package:tomiru_social_flutter/features/home/widgets/section_header.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/features/Home/widgets/products_widget/products_list.dart';
import 'package:tomiru_social_flutter/features/home/widgets/voucher_list.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon_widgets.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/service_content.dart';
import 'package:tomiru_social_flutter/features/settings/screens/settings_screen.dart';
import 'package:get/get.dart';
import "package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  String? username;
  int index = 0;
  // lay position
  Position? lastPosition;
  Placemark? _position;
  Weather? temperature;
  WeatherFactory wf = WeatherFactory(AppConstants.weatherApiKey);

  //
  @override
  void initState() {
    super.initState();
    lastPosition = Get.find<ProfileController>().getPosition();
    getPositionAndWeather();
    username = Get.find<AuthController>().getUserSelfInfo()?.fullname ?? '';
    // fetchUserBalance();
  }

  // Future<void> fetchUserBalance() async {
  //   List<UserBalance>? userBalance =
  //       Get.find<UsersProfileController>().userBalance;

  //   setState(() {
  //     userBalanceList = userBalance!;
  //   });
  //   print(userBalance?.map((balance) => balance.toJson()).toList());

  //   print("Đây là homescreen");
  // }

  Future<Position> _requestPermissionsAndInitializeLocation() async {
    bool serviceEnabled;
    bool locationSetting;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    try {
      setState(() {
        index = 1;
      });
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      setState(() {
        index = 0;
      });
      return lastPosition!;
    }
  }

  void getPositionAndWeather() async {
    Position? position = await _requestPermissionsAndInitializeLocation();
    if (index == 1) {
      await Get.find<ProfileController>().savePosition(position);
    }
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Weather w = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    setState(() {
      _position = placemarks[0];
      temperature = w;
    });
  }
  // lay position

  Widget _body(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: PersistentHeader(
            child: welcomeToPage(),
            minHeight: 80,
            maxHeight: 80,
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _mainHome(),
        )
      ],
    );
  }

  Widget _mainHome() {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const WalletInfo(),
            ),
            const SizedBox(height: 20),
            exploreContent(),
            const HeaderContent(title: "Nhật ký"),
            HorizontalImageListScreen(),
            const HeaderContent(title: "Mạng lưới"),
            ContactWithOthers(),
            const HeaderContent(title: "Gian hàng Tomiru"),
            HorizontalProductListScreen(),
            const HeaderContent(title: "Khuyến mãi"),
            const VerticalVoucherList(),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        onBackPress: () {
          print("mnsd");
        },
        image: "assets/images/logo-tomiru-v2.png",
        widget: <Widget>[
          customQr(context),
          customMessage(context),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
        padding: 12.0,
      ),
      body: _body(context),
    );
  }

  Widget welcomeToPage() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Xin chào${username != '' ? ', $username' : ''}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                if (_position != null)
                  Text(
                      "Hôm nay ${_position?.administrativeArea} ${temperature?.temperature?.celsius?.round()}°C")
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSearch(),
                    const Text("Tìm kiếm", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSetting(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsScreen()));
                      },
                    ),
                    const Text("Cài đặt", style: TextStyle(fontSize: 12)),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget exploreContent() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Khám phá",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ServiceContent(),
            SizedBox(height: 10),
          ],
        ));
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  PersistentHeader(
      {required this.child, required this.minHeight, required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Container(
      padding: const EdgeInsets.only(top: 12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide.lerp(
                const BorderSide(color: Colors.transparent),
                BorderSide(color: Colors.grey[300] ?? Colors.transparent),
                progress),
          )),
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(PersistentHeader oldDelegate) {
    return child != oldDelegate.child;
  }
}
