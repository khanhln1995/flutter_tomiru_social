import 'dart:async';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/verification/controllers/verification_controller.dart';
import 'package:tomiru_social_flutter/features/verification/screens/new_pass_screen.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/util/styles.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_app_bar_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_button_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_dialog_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String? email;
  final bool fromSignUp;
  final String? otp;

  const VerificationScreen(
      {super.key,
      required this.email,
      required this.fromSignUp,
      required this.otp});

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  String? _email;
  Timer? _timer;
  int _seconds = 0;
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    if(widget.otp != null){
      Get.find<VerificationController>().setVerificationCode(widget.otp.toString());
    }
    // Initialize OTP controller and autofill OTP value
    _otpController = TextEditingController();
    _otpController.text = Get.find<VerificationController>().verificationCode;

    Get.find<VerificationController>()
        .updateVerificationCode('', canUpdate: false);
    _email = widget.email;
    _startTimer();
  }

  void _getOTP() {
    Future.delayed(const Duration(seconds: 2), () {
      final verificationCode =
          Get.find<VerificationController>().verificationCode;
      setState(() {
        _otpController.text = verificationCode;
      });
    });
  }

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds = _seconds - 1;
      if (_seconds == 0) {
        timer.cancel();
        _timer?.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'phone_verification'.tr),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Center(
                  child: Container(
                width: context.width > 700 ? 700 : context.width,
                padding: context.width > 700
                    ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
                    : null,
                decoration: context.width > 700
                    ? BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusSmall),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[Get.isDarkMode ? 700 : 300]!,
                              blurRadius: 5,
                              spreadRadius: 1)
                        ],
                      )
                    : null,
                child: GetBuilder<VerificationController>(
                    builder: (verificationController) {
                  return Column(children: [
                    Get.find<SplashController>().configModel!.demo!
                        ? Text(
                            'for_demo_purpose'.tr,
                            style: robotoRegular,
                          )
                        : SizedBox(
                            width: 210,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: 'enter_the_verification_sent_to'.tr,
                                      style: robotoRegular.copyWith(
                                          color:
                                              Theme.of(context).disabledColor)),
                                  TextSpan(
                                      text: ' $_email',
                                      style: robotoMedium.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color)),
                                ])),
                              ],
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 29, vertical: 35),
                      child: PinCodeTextField(
                        length: 6, // 6-digit OTP
                        appContext: context,
                        controller: _otpController, // Autofill OTP from state
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.slide,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight:
                              MediaQuery.of(context).size.width > 600 ? 60 : 45,
                          fieldWidth:
                              MediaQuery.of(context).size.width > 600 ? 60 : 45,
                          borderWidth: 1,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSmall),
                          selectedColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          selectedFillColor: Colors.white,
                          inactiveFillColor:
                              Theme.of(context).disabledColor.withOpacity(0.2),
                          inactiveColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          activeColor:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          activeFillColor:
                              Theme.of(context).disabledColor.withOpacity(0.2),
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        onChanged:
                            verificationController.updateVerificationCode,
                        beforeTextPaste: (text) => true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'did_not_receive_the_code'.tr,
                              style: robotoRegular.copyWith(
                                  color: Theme.of(context).disabledColor),
                            ),
                          ]),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    _otpController.text.length == 6
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: CustomButtonWidget(
                              radius: Dimensions.radiusDefault,
                              buttonText: 'verify'.tr,
                              isLoading: verificationController.isLoading,
                              onPressed: () {
                                if (widget.fromSignUp) {
                                  verificationController
                                      .sigupConfirmOTP(widget.email!, _otpController.text)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      showAnimatedDialog(
                                          context,
                                          Center(
                                            child: Container(
                                              width: 300,
                                              padding: const EdgeInsets.all(
                                                  Dimensions
                                                      .paddingSizeExtraLarge),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  borderRadius: BorderRadius
                                                      .circular(Dimensions
                                                          .radiusExtraLarge)),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Image.asset(Images.checked,
                                                        width: 100,
                                                        height: 100),
                                                    const SizedBox(
                                                        height: Dimensions
                                                            .paddingSizeLarge),
                                                    Text('verified'.tr,
                                                        style:
                                                            robotoBold.copyWith(
                                                          fontSize: 30,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .color,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        )),
                                                  ]),
                                            ),
                                          ),
                                          dismissible: false);
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        Get.offNamed(
                                            RouteHelper.getSignInRoute(
                                                'sig-in'));
                                      });
                                    } else {
                                      showCustomSnackBar(value.message);
                                    }
                                  });
                                } else {
                                  verificationController
                                      .forgotConfirmOTP(_otpController.text)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      if (ResponsiveHelper.isDesktop(context)) {
                                        Get.dialog(Center(
                                            child: NewPassScreen(
                                                resetToken:
                                                    verificationController
                                                        .verificationCode,
                                                number: _email,
                                                fromPasswordChange: false,
                                                fromDialog: true)));
                                      } else {
                                        print(
                                            '~~~~~~~~~~~~~~go to reset-password~~~~~~~~~~~~~');
                                        Get.toNamed(
                                            RouteHelper.getResetPasswordRoute(
                                                _email,
                                                verificationController
                                                    .verificationCode,
                                                'reset-password'));
                                      }
                                    } else {
                                      showCustomSnackBar(value.message);
                                    }
                                  });
                                }
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                    // : const Center(
                    //     child: CircularProgressIndicator(
                    //         valueColor:
                    //             AlwaysStoppedAnimation<Color>(Colors.blue)),
                    //   )
                  ]);
                }),
              ))),
        )));
  }
}
