import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/wallet_info.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/contact_member.dart';
import 'package:tomiru_social_flutter/features/home/widgets/section_header.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/widgets/products_widget/products_list.dart';
import 'package:tomiru_social_flutter/features/home/widgets/voucher_list.dart';
import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/bottom_main_bar.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon_widgets.dart';
import 'package:tomiru_social_flutter/widgets/global/newWidget/service_content.dart';
import 'package:tomiru_social_flutter/features/settings/screens/settings_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

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
            VerticalVoucherList(),
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
          customQr(),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Xin chào",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Hôm nay 30°C")
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
                      onPressed: () => SettingsScreen(),
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
