import 'package:tomiru_social_flutter/common/widgets_2/custom_toast.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, bool showToaster = false}) {
  if (message != null && message.isNotEmpty) {
    if (showToaster && !GetPlatform.isWeb) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: Dimensions.fontSizeDefault,
        webShowClose: true,
        webPosition: "left",
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.endToStart,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: CustomToast(text: message, isError: isError),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
