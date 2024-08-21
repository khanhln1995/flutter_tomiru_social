import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_button_widget.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/styles.dart';

class DemoResetDialogWidget extends StatefulWidget {
  const DemoResetDialogWidget({super.key});

  @override
  State<DemoResetDialogWidget> createState() => _DemoResetDialogWidgetState();
}

class _DemoResetDialogWidgetState extends State<DemoResetDialogWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: Theme.of(context).cardColor,
        ),
        width: 500,
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.error_outline,
              color: Theme.of(context).primaryColor, size: 55),
          const SizedBox(height: Dimensions.paddingSizeLarge),
          Text('session_time_out'.tr,
              style:
                  robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
          const SizedBox(height: Dimensions.paddingSizeLarge),
          Text(
            'though_it_is_demo_text'.tr,
            textAlign: TextAlign.center,
            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraOverLarge),
          CustomButtonWidget(
              isLoading: _isLoading,
              buttonText: 'okay'.tr,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                Get.find<SplashController>().getConfigData().then((isSuccess) {
                  if (isSuccess) {
                    setState(() {
                      _isLoading = false;
                    });
                    Get.offAllNamed(
                        RouteHelper.getInitialRoute(fromSplash: true));
                  }
                });
              }),
        ]),
      ),
    );
  }
}
