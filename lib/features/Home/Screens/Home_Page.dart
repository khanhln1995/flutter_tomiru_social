import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/wallet_info.dart';
import 'package:tomiru_social_flutter/features/Home/Widgets/contact_member.dart';
import 'package:tomiru_social_flutter/features/home/widgets/section_header.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/widgets/products_widget/products_list.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/features/home/widgets/voucher_list.dart';
import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/bottom_main_bar.dart';
import 'package:tomiru_social_flutter/features/Home/Screens/Social_page.dart';

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
        SliverToBoxAdapter(
          child: _mainHome(),
        )
      ],
    );
  }

  Widget _mainHome() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            welcomeToPage(),
            const SizedBox(height: 20),
            WalletInfo(),
            const SizedBox(height: 20),
            exploreContent(),
            const HeaderContent(title: "Nhật ký"),
            HorizontalImageListScreen(),
            const HeaderContent(title: "Mạng lưới"),
            ContactWithOthers(),
            const HeaderContent(title: "Gian hàng Tomiru"),
            HorizontalProductListScreen(),
            const HeaderContent(title: "Khuyến mãi"),
            VerticalVoucherList()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        onBackPress: () {},
        image: "assets/images/logo-tomiru-v2.png",
        widget: [
          CustomIcon(icon: Icon(Icons.search, color: Colors.black)),
          SizedBox(width: 12.0)
        ],
        padding: 12.0,
      ),
      body: _body(context),
      bottomNavigationBar: const BottomMainBar(),
    );
  }

  Widget welcomeToPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Xin chào",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Hôm nay 30°C")
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Cir
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/icon-scan.jpg",
                  height: 20,
                  width: 20,
                ),
              ),
              Text("QR Code"),
            ],
          ),
        ),
      ],
    );
  }

  Widget exploreContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Khám phá",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _exploreButton(
                Image.asset('assets/images/tomiru-icon-white.png',
                    width: 30, height: 30),
                "Mạng xã hội",
                [Color(0xFF87CEFA), Color(0xFF1E90FF)], () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      SocialNetworkPage(),
                  transitionDuration: const Duration(seconds: 1),
                ),
              );
            }),
            _exploreButton(
                Icon(Icons.shopping_cart, size: 30, color: Colors.white),
                "Shopping",
                [Color(0xFFFF6347), Color(0xFFDC143C)],
                () {}),
            _exploreButton(
                Icon(Icons.miscellaneous_services,
                    size: 30, color: Colors.white),
                "Dịch vụ",
                [Color(0xFF98FB98), Color(0xFF32CD32)],
                () {}),
            _exploreButton(
                Icon(Icons.business_center_rounded,
                    size: 30, color: Colors.white),
                "Kinh doanh",
                [Color(0xFFFFa500), Color(0xFFFF8C00)],
                () {}),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _exploreButton(
      Widget icon, String label, List<Color> colors, VoidCallback? onPressed) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: colors[1].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
            padding: EdgeInsets.zero,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
