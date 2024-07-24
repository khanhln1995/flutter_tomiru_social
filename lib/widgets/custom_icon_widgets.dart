import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/Notify_Screen/screens/notify_screen.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';

Widget customMessage() {
  return CustomIcon(
    icon: Image.asset("assets/images/message.png"),
    quantity: 1,
    onPressed: () {},
  );
}

Widget customNotification(BuildContext context) {
  return CustomIcon(
    icon: Image.asset("assets/images/notification.png"),
    quantity: 2,
    onPressed: () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const NotifyScreen()));
       Get.toNamed(RouteHelper.getListNotify());
      // Get.toNamed(RouteHelper.getWalletRoute());
    },
  );
}

Widget customSetting({
   VoidCallback? onPressed,
  IconData icon = Icons.settings,
  Color iconColor = Colors.grey,
}) {
  return CustomIcon(
    icon: Icon(icon, color: iconColor),
    onPressed: onPressed,
  );
}

Widget customSearch() {
  return CustomIcon(
      icon: Icon(Icons.search, color: Colors.black), onPressed: () {});
}

Widget customQr() {
  return CustomIcon(icon: Image.asset(Images.qrIcon), onPressed: () {});
}
