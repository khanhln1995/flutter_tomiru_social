import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/camera/screen/qr_scanner_screen.dart';

import 'package:tomiru_social_flutter/common/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';

Widget customMessage(BuildContext context) {
  return CustomIcon(
    icon: Image.asset(Images.messageIcon),
    quantity: 1,
    onPressed: () {
      Get.toNamed(RouteHelper.getMessage());
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const MessageScreen()));
    },
  );
}

Widget customNotification(BuildContext context) {
  return CustomIcon(
    icon: Image.asset(Images.notificationIcon),
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
      icon: Icon(Icons.search, color: Colors.black),
      onPressed: () {
        print("11111111111");
        Get.toNamed(RouteHelper.getSearchRoute());
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
      });
}

Widget customQr(BuildContext context) {
  return CustomIcon(icon: Image.asset(Images.qrIcon), onPressed:(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>QrScannerScreen()));
  });
}
