import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/common/widgets/validate_check.dart';
import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/auth/screens/sign_up_screen.dart';
import 'package:tomiru_social_flutter/features/auth/widgets/trams_conditions_check_box_widget.dart';
import 'package:tomiru_social_flutter/features/auth/widgets/social_login_widget.dart';
import 'package:tomiru_social_flutter/features/verification/screens/forget_pass_screen.dart';
import 'package:tomiru_social_flutter/helper/custom_validator.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/styles.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_button_widget.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInWidget extends StatefulWidget {
  final bool exitFromApp;
  final bool backFromThis;
  const SignInWidget(
      {super.key, required this.exitFromApp, required this.backFromThis});

  @override
  SignInWidgetState createState() => SignInWidgetState();
}

class SignInWidgetState extends State<SignInWidget> {
  // final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  // final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // String? _countryDialCode;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    // _countryDialCode =
    //     Get.find<AuthController>().getUserCountryCode().isNotEmpty
    //         ? Get.find<AuthController>().getUserCountryCode()
    //         : CountryCode.fromCountryCode(
    //                 Get.find<SplashController>().configModel!.country!)
    //             .dialCode;
    // _phoneController.text = Get.find<AuthController>().getUserNumber();
    _emailController.text = Get.find<AuthController>().getUserEmail();
    _passwordController.text = Get.find<AuthController>().getUserPassword();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<AuthController>(builder: (authController) {
      return Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Form(
          key: _formKeyLogin,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                SizedBox(height: isDesktop ? 30 : 0),

                CustomTextFieldWidget(
                  hintText: 'Nhập email',
                  controller: _emailController,
                  focusNode: _emailFocus,
                  nextFocus: _passwordFocus,
                  inputType: TextInputType.emailAddress,
                  isPhone: false,
                  labelText: 'Email',
                  required: true,
                  prefixIcon: CupertinoIcons.mail_solid,
                  validator: (value) => ValidateCheck.validateEmail(value),
                ),
                // CustomTextFieldWidget(
                //   hintText: 'enter_phone_number',
                //   controller: _phoneController,
                //   focusNode: _phoneFocus,
                //   nextFocus: _passwordFocus,
                //   inputType: TextInputType.phone,
                //   isPhone: true,
                //   onCountryChanged: (CountryCode countryCode) {
                //     _countryDialCode = countryCode.dialCode;
                //   },
                //   countryDialCode: _countryDialCode != null
                //       ? CountryCode.fromCountryCode(Get.find<SplashController>()
                //               .configModel!
                //               .country!)
                //           .code
                //       : Get.find<LocalizationController>().locale.countryCode,
                //   labelText: 'phone',
                //   required: true,
                //   validator: (value) => ValidateCheck.validateEmptyText(
                //       value, "phone_number_field_is_required"),
                // ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  hintText: 'Nhập password',
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  onSubmit: (text) =>
                      (GetPlatform.isWeb) ? _login(authController) : null,
                  labelText: 'Password',
                  required: true,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "password_field_is_required"),
                ),
                SizedBox(
                    height: ResponsiveHelper.isDesktop(context)
                        ? Dimensions.paddingSizeDefault
                        : Dimensions.paddingSizeExtraSmall),

                Row(children: [
                  Expanded(
                    child: ListTile(
                      onTap: () => authController.toggleRememberMe(),
                      leading: SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          side: BorderSide(color: Theme.of(context).hintColor),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: Theme.of(context).primaryColor,
                          value: authController.isActiveRememberMe,
                          onChanged: (bool? isChecked) =>
                              authController.toggleRememberMe(),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.paddingSizeSmall),
                        child: Text('ghi nhớ', style: robotoRegular),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      horizontalTitleGap: 0,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Get.back();
                      if (isDesktop) {
                        // Get.dialog(const Center(
                        //     child: ForgetPassScreen(
                        //         fromSocialLogin: false,
                        //         socialLogInModel: null,
                        //         fromDialog: true)));
                      } else {
                        Get.toNamed(
                            RouteHelper.getForgotPassRoute(false, null));
                      }
                    },
                    child: Text('${'quên mật khẩu'}?',
                        style: robotoRegular.copyWith(
                            color: Theme.of(context).hintColor)),
                  ),
                ]),
                const SizedBox(height: Dimensions.paddingSizeLarge),

                isDesktop
                    ? const SizedBox()
                    : TramsConditionsCheckBoxWidget(
                        authController: authController),
                isDesktop
                    ? const SizedBox()
                    : const SizedBox(height: Dimensions.paddingSizeLarge),

                CustomButtonWidget(
                    height: isDesktop ? 50 : null,
                    width: isDesktop ? 250 : null,
                    buttonText: 'Đăng nhập',
                    radius: isDesktop
                        ? Dimensions.radiusSmall
                        : Dimensions.radiusDefault,
                    isBold: isDesktop ? false : true,
                    isLoading: authController.isLoading,
                    onPressed: () => _login(authController)
                    // authController.acceptTerms
                    //     ? () => _login(authController, _countryDialCode!)
                    //     : null,
                    ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                !isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text('Bạn chưa có tài khoản ?',
                                style: robotoRegular.copyWith(
                                    color: Theme.of(context).hintColor)),
                            InkWell(
                              onTap: authController.isLoading
                                  ? null
                                  : () {
                                      if (isDesktop) {
                                        Get.back();
                                        Get.dialog(const SignUpScreen());
                                      } else {
                                        Get.toNamed(
                                            RouteHelper.getSignUpRoute());
                                      }
                                    },
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.paddingSizeExtraSmall),
                                child: Text('Đăng ký',
                                    style: robotoMedium.copyWith(
                                        color: Theme.of(context).primaryColor)),
                              ),
                            ),
                          ])
                    : const SizedBox(),

                const SizedBox(height: Dimensions.paddingSizeSmall),

                // const SocialLoginWidget(),

                // isDesktop ? const SizedBox() : const GuestButtonWidget(),
              ]),
        ),
      );
    });
  }

  void _login(
    AuthController authController,
    // String countryDialCode
  ) async {
    // String phone = _phoneController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // String numberWithCountryCode = countryDialCode + phone;
    // PhoneValid phoneValid =
    //     await CustomValidator.isPhoneValid(numberWithCountryCode);
    // numberWithCountryCode = phoneValid.phone;

    if (_formKeyLogin!.currentState!.validate()) {
      // if (phone.isEmpty) {
      //   showCustomSnackBar('enter_phone_number');
      // } else if (!phoneValid.isValid) {
      //   showCustomSnackBar('invalid_phone_number');
      // }
      if (email.isEmpty) {
        showCustomSnackBar('Vui lòng nhập Email');
      } else if (password.isEmpty) {
        showCustomSnackBar('Vui lòng nhập Mật khẩu');
      } else if (password.length < 6) {
        showCustomSnackBar('Độ dài password phải lớn hơn 6');
      } else {
        authController
            .login(email, password, alreadyInApp: widget.backFromThis)
            .then((status) async {
          if (status.isSuccess) {
            print(
                "------------------------------------------login------------------------");
            _processSuccessSetup(
                authController,
                email,
                password,
                // countryDialCode,
                status
                // numberWithCountryCode
                );
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }
  }

  void _processSuccessSetup(
    AuthController authController,
    // String phone,
    String email,
    String password,
    // String countryDialCode,
    ResponseModel status,
    // String numberWithCountryCode
  ) {
    if (authController.isActiveRememberMe) {
      authController.saveUserNumberAndPassword(
          // phone,
          email,
          password
          // countryDialCode
          );
    } else {
      authController.clearUserNumberAndPassword();
    }
    if (widget.backFromThis) {
      if (ResponsiveHelper.isDesktop(context)) {
        Get.offAllNamed(RouteHelper.getInitialRoute(fromSplash: false));
      } else {
        Get.offNamed(RouteHelper.getInitialRoute(fromSplash: false));
      }
    } else {
      Get.find<SplashController>()
          .navigateToLocationScreen('sign-in', offNamed: true);
    }
    // String token = status.message!.substring(1, status.message!.length);
    // if (Get.find<SplashController>().configModel!.customerVerification! &&
    //     int.parse(status.message![0]) == 0) {
    //   List<int> encoded = utf8.encode(password);
    //   String data = base64Encode(encoded);
    //   Get.toNamed(RouteHelper.getVerificationRoute(
    //       // numberWithCountryCode,
    //       email,
    //       token,
    //       RouteHelper.signUp,
    //       data));
    // } else {
    //   print(
    //       "------------------------------------------123------------------------");
    //   if (widget.backFromThis) {
    //     if (ResponsiveHelper.isDesktop(context)) {
    //       Get.offAllNamed(RouteHelper.getInitialRoute(fromSplash: false));
    //     } else {
    //       print(
    //           "------------------------------------------test------------------------");
    //       Get.back();
    //     }
    //   } else {
    //     Get.find<SplashController>()
    //         .navigateToLocationScreen('sign-in', offNamed: true);
    //   }
    // }
  }
}
