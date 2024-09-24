import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/social_network/Screens/social_network.dart';
import 'package:tomiru_social_flutter/features/social_network/controller/social_controller.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:get/get.dart';

class ServiceContent extends StatelessWidget {
  const ServiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _exploreButton(
            Image.asset('assets/images/tomiru-icon-white.png',
                width: 30, height: 30),
            "Mạng xã hội",
            [const Color(0xFF87CEFA), const Color(0xFF1E90FF)], () {
          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation1, animation2) =>
          //         const SocialNetwork(),
          //     transitionDuration: const Duration(seconds: 1),
          //   ),
          // );
          Get.find<SocialController>().getFollowersTweets(0);
        }),
        _exploreButton(
            const Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            "Shopping",
            [const Color(0xFFFF6347), const Color(0xFFDC143C)],
            () {}),
        _exploreButton(
            const Icon(Icons.miscellaneous_services,
                size: 30, color: Colors.white),
            "Dịch vụ",
            [const Color(0xFF98FB98), const Color(0xFF32CD32)],
            () {}),
        _exploreButton(
            const Icon(Icons.business_center_rounded,
                size: 30, color: Colors.white),
            "Kinh doanh",
            [const Color(0xFFFFa500), const Color(0xFFFF8C00)], () {
          Navigator.pushNamed(context, RouteHelper.getBusinessRoute());
        }),
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
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
