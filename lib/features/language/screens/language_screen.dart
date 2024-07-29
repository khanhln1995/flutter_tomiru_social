import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_app_bar_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_asset_image_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/menu_drawer_widget.dart';
import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
// import 'package:tomiru_social_flutter/features/language/screens/web_language_screen.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_button_widget.dart';
import 'package:tomiru_social_flutter/features/language/widgets/language_card_widget.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/styles.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  final bool fromMenu;
  const LanguageScreen({super.key, required this.fromMenu});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.fromMenu || ResponsiveHelper.isDesktop(context))
          ? CustomAppBarWidget(title: 'language'.tr, isBackButtonExist: true)
          : null,
      endDrawer: const MenuDrawerWidget(),
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).cardColor,
      body:
          GetBuilder<LocalizationController>(builder: (localizationController) {
        return
            // ResponsiveHelper.isDesktop(context)
            //     ? WebLanguageScreen(localizationController: localizationController)
            //     :
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.center,
            child: CustomAssetImageWidget(
              Images.languageBg,
              height: 210,
              width: 210,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge),
            child: Text('choose_your_language'.tr,
                style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge),
            child: Text('choose_your_language_to_proceed'.tr,
                style:
                    robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: localizationController.languages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge),
                itemBuilder: (context, index) {
                  return LanguageCardWidget(
                    languageModel: localizationController.languages[index],
                    localizationController: localizationController,
                    index: index,
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeDefault,
                horizontal: Dimensions.paddingSizeExtraLarge),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
            ),
            child: CustomButtonWidget(
              buttonText: 'next'.tr,
              onPressed: () {
                if (localizationController.languages.isNotEmpty &&
                    localizationController.selectedLanguageIndex != -1) {
                  localizationController.setLanguage(Locale(
                    AppConstants
                        .languages[localizationController.selectedLanguageIndex]
                        .languageCode!,
                    AppConstants
                        .languages[localizationController.selectedLanguageIndex]
                        .countryCode,
                  ));
                  if (widget.fromMenu) {
                    Navigator.pop(context);
                  } else {
                    Get.offNamed(RouteHelper.getOnBoardingRoute());
                  }
                } else {
                  showCustomSnackBar('select_a_language'.tr);
                }
              },
            ),
          ),
        ]);
      }),
    );
  }
}
