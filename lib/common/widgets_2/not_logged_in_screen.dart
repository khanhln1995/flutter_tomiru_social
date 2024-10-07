import 'package:tomiru_social_flutter/features/auth/widgets/auth_dialog_widget.dart';
// import 'package:tomiru_social_flutter/features/order/controllers/order_controller.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/util/styles.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_button_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/footer_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotLoggedInScreen extends StatelessWidget {
  final Function(bool success) callBack;
  const NotLoggedInScreen({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      child: FooterViewWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                Images.guest,
                width: MediaQuery.of(context).size.height * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'sorry'.tr,
                style: robotoBold.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'you_are_not_logged_in'.tr,
                style: robotoRegular.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.0175,
                    color: Theme.of(context).disabledColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: 200,
                child: CustomButtonWidget(
                    buttonText: 'login_to_continue'.tr,
                    /*height: 40,*/ onPressed: () async {
                      if (!ResponsiveHelper.isDesktop(context)) {
                        await Get.toNamed(
                            RouteHelper.getSignInRoute(Get.currentRoute));
                      } else {
                        Get.dialog(const Center(
                                child: AuthDialogWidget(
                                    exitFromApp: false, backFromThis: true)))
                            .then((value) => callBack(true));
                        // Get.dialog(const SignInScreen(exitFromApp: false, backFromThis: true)).then((value) => callBack(true));
                      }
                      // if (Get.find<OrderController>().showBottomSheet) {
                      //   Get.find<OrderController>().showRunningOrders();
                      // }
                      callBack(true);
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
