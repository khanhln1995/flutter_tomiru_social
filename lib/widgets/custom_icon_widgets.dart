import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/search/screens/search_page.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/util/images.dart';

Widget customMessage() {
  return CustomIcon(
    icon: Image.asset(Images.messageIcon),
    quantity: 1,
    onPressed: () {},
  );
}

Widget customNotification() {
  return CustomIcon(
    icon: Image.asset(Images.notificationIcon),
    quantity: 2,
    onPressed: () {},
  );
}

Widget customSetting() {
  return CustomIcon(
    icon: Icon(Icons.settings, color: Colors.grey[700]),
    onPressed: () {},
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

Widget customQr() {
  return CustomIcon(icon: Image.asset(Images.qrIcon), onPressed: () {});
}
