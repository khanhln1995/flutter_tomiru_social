import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon.dart';

Widget customMessage() {
  return CustomIcon(
    icon: Image.asset("assets/images/message.png"),
    quantity: 1,
    onPressed: () {},
  );
}

Widget customNotification() {
  return CustomIcon(
    icon: Image.asset("assets/images/notification.png"),
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
      icon: Icon(Icons.search, color: Colors.black), onPressed: () {});
}
