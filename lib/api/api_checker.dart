import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
// import 'package:tomiru_social_flutter/features/favourite/controllers/favourite_controller.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:get/get.dart';

class ApiChecker {
  static Future<void> checkApi(Response response,
      {bool showToaster = false}) async {
    if (response.statusCode == 401) {
      await Get.find<AuthController>()
          .clearSharedData(removeToken: false)
          .then((value) {
        // Get.find<FavouriteController>().removeFavourites();
        Get.offAllNamed(RouteHelper.getInitialRoute());
      });
    } else {
      showCustomSnackBar(response.statusText, showToaster: showToaster);
    }
  }
}
