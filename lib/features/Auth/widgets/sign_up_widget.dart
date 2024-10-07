import 'dart:convert';
// import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/common/widgets_2/validate_check.dart';
// import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
import 'package:tomiru_social_flutter/features/profile/controllers/profile_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/signup_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/screens/sign_in_screen.dart';
import 'package:tomiru_social_flutter/features/auth/widgets/trams_conditions_check_box_widget.dart';
import 'package:tomiru_social_flutter/helper/custom_validator.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/styles.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_button_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  SignUpWidgetState createState() => SignUpWidgetState();
}

class SignUpWidgetState extends State<SignUpWidget> {
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _referCodeFocus = FocusNode();
  final FocusNode _userNameFocus = FocusNode();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referCodeController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String? _countryDialCode;
  String? _selectedGender; // Store selected gender
  GlobalKey<FormState>? _formKeySignUp;

  @override
  void initState() {
    super.initState();
    _formKeySignUp = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeySignUp,
      child: Container(
        width: context.width > 700 ? 700 : context.width,
        decoration: context.width > 700
            ? BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              )
            : null,
        child: GetBuilder<AuthController>(builder: (authController) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: Dimensions.paddingSizeSmall),
            Row(children: [
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'ex_jhon',
                  labelText: 'first_name'.tr,
                  showLabelText: true,
                  required: true,
                  controller: _firstNameController,
                  focusNode: _firstNameFocus,
                  nextFocus: _lastNameFocus,
                  inputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  prefixIcon: CupertinoIcons.person_alt_circle_fill,
                  levelTextSize: Dimensions.paddingSizeDefault,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "first_name_field_is_required".tr),
                ),
              ),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(
                child: CustomTextFieldWidget(
                  titleText: 'last_name'.tr,
                  hintText: 'ex_doe',
                  labelText: 'last_name'.tr,
                  showLabelText: true,
                  required: true,
                  controller: _lastNameController,
                  focusNode: _lastNameFocus,
                  nextFocus: _referCodeFocus,
                  inputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  prefixIcon: CupertinoIcons.person_alt_circle_fill,
                  levelTextSize: Dimensions.paddingSizeDefault,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "last_name_field_is_required".tr),
                ),
              )
            ]),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            Row(children: [
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'enter_username'.tr,
                  labelText: 'username'.tr,
                  showLabelText: true,
                  required: true,
                  controller: _userNameController,
                  focusNode: _userNameFocus,
                  nextFocus: _referCodeFocus,
                  inputType: TextInputType.text,
                  isPhone: false,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "user_name_field_is_required".tr),
                ),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeLarge),

            // Gender selection as two tappable boxes
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'gender'.tr,
                      style: robotoRegular.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      _buildGenderBox(context, 'male'.tr),
                      const SizedBox(width: 20),
                      _buildGenderBox(context, 'female'.tr),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge),

            Row(children: [
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'enter_ref_code'.tr,
                  labelText: 'code'.tr,
                  showLabelText: true,
                  required: true,
                  controller: _referCodeController,
                  focusNode: _referCodeFocus,
                  nextFocus: _emailFocus,
                  inputType: TextInputType.text,
                  isPhone: false,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "refer_code_field_is_required".tr),
                ),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            Row(children: [
              ResponsiveHelper.isDesktop(context)
                  ? Expanded(
                      child: CustomTextFieldWidget(
                        hintText: 'enter_email'.tr,
                        labelText: 'email'.tr,
                        showLabelText: true,
                        required: true,
                        controller: _emailController,
                        focusNode: _emailFocus,
                        nextFocus: ResponsiveHelper.isDesktop(context)
                            ? _phoneFocus
                            : _passwordFocus,
                        inputType: TextInputType.emailAddress,
                        prefixIcon: CupertinoIcons.mail_solid,
                        validator: (value) =>
                            ValidateCheck.validateEmail(value),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                  width: ResponsiveHelper.isDesktop(context)
                      ? Dimensions.paddingSizeSmall
                      : 0),
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'enter_phone_number'.tr,
                  labelText: 'phone'.tr,
                  showLabelText: true,
                  required: true,
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  nextFocus: ResponsiveHelper.isDesktop(context)
                      ? _passwordFocus
                      : _emailFocus,
                  inputType: TextInputType.phone,
                  isPhone: true,
                  validator: (value) => ValidateCheck.validateEmptyText(
                      value, "phone_number_field_is_required".tr),
                ),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            CustomTextFieldWidget(
              labelText: 'email'.tr,
              hintText: 'enter_email'.tr,
              showLabelText: true,
              required: true,
              controller: _emailController,
              focusNode: _emailFocus,
              nextFocus: _passwordFocus,
              inputType: TextInputType.emailAddress,
              prefixIcon: CupertinoIcons.mail_solid,
              validator: (value) => ValidateCheck.validateEmail(value),
              divider: false,
            ),
            SizedBox(
                height: !ResponsiveHelper.isDesktop(context)
                    ? Dimensions.paddingSizeLarge
                    : 0),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(children: [
                  CustomTextFieldWidget(
                    hintText: '8+characters'.tr,
                    labelText: 'password'.tr,
                    showLabelText: true,
                    required: true,
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    nextFocus: _confirmPasswordFocus,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) => ValidateCheck.validateEmptyText(
                        value, "password_field_is_required".tr),
                  ),
                ]),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            CustomTextFieldWidget(
              hintText: '8+characters'.tr,
              labelText: 'confirm_password'.tr,
              showLabelText: true,
              required: true,
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocus,
              nextFocus: null,
              inputAction: TextInputAction.done,
              inputType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock,
              isPassword: true,
              onSubmit: null,
              validator: (value) => ValidateCheck.validateConfirmPassword(
                  value, _passwordController.text),
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            TramsConditionsCheckBoxWidget(
                authController: authController,
                fromSignUp: true,
                fromDialog: ResponsiveHelper.isDesktop(context) ? true : false),
            SizedBox(
                height: ResponsiveHelper.isDesktop(context)
                    ? Dimensions.paddingSizeExtraLarge
                    : Dimensions.paddingSizeDefault),
            CustomButtonWidget(
              height: ResponsiveHelper.isDesktop(context) ? 50 : null,
              width: ResponsiveHelper.isDesktop(context) ? 250 : null,
              radius: ResponsiveHelper.isDesktop(context)
                  ? Dimensions.radiusSmall
                  : Dimensions.radiusDefault,
              isBold: !ResponsiveHelper.isDesktop(context),
              fontSize: ResponsiveHelper.isDesktop(context)
                  ? Dimensions.fontSizeExtraSmall
                  : null,
              buttonText: 'sign_up'.tr,
              isLoading: authController.isLoading,
              onPressed: authController.acceptTerms
                  ? () => _register(authController, _countryDialCode ?? '+84')
                  : null,
            ),
            SizedBox(
                height: ResponsiveHelper.isDesktop(context)
                    ? Dimensions.paddingSizeExtraLarge
                    : Dimensions.paddingSizeDefault),
            !ResponsiveHelper.isDesktop(context)
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('already_have_account'.tr,
                        style: robotoRegular.copyWith(
                            color: Theme.of(context).hintColor)),
                    InkWell(
                      onTap: authController.isLoading
                          ? null
                          : () {
                              if (ResponsiveHelper.isDesktop(context)) {
                                Get.back();
                                Get.dialog(const SignInScreen(
                                    exitFromApp: false, backFromThis: false));
                              } else {
                                if (Get.currentRoute == RouteHelper.signUp) {
                                  Get.back();
                                } else {
                                  Get.toNamed(RouteHelper.getSignInRoute(
                                      RouteHelper.signUp));
                                }
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall),
                        child: Text('sign_in'.tr,
                            style: robotoMedium.copyWith(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ])
                : const SizedBox(),
          ]);
        }),
      ),
    );
  }

  // Helper method to build gender selection boxes
  Widget _buildGenderBox(BuildContext context, String gender) {
    bool isSelected = _selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: robotoMedium.copyWith(
              color: isSelected ? Colors.white : Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }

  void _register(AuthController authController, String? countryCode) async {
    if (countryCode == null || countryCode.isEmpty) {
      showCustomSnackBar("Country code is required");
      return;
    }
    SignUpBodyModel? signUpModel = await _prepareSignUpBody(countryCode);

    if (signUpModel == null) {
      return;
    } else {
      authController.registration(signUpModel).then((status) async {
        _handleResponse(
          status,
        );
      });
    }
  }

  void _handleResponse(ResponseModelWithBody status) {
    if (status.isSuccess) {
      print("otp: ${status.body?["meta"]?["otp"]}");
      print("email: ${status.body?["data"]?["email"]}");
      String email = status.body?["data"]?["email"];
      String otp = status.body?["meta"]?["otp"];
      Get.toNamed(RouteHelper.getVerificationRoute(
          email, otp, RouteHelper.signUp));
    } else {
      showCustomSnackBar(status.message);
    }
  }

  Future<SignUpBodyModel?> _prepareSignUpBody(String countryCode) async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String number = _phoneController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String referCode = _referCodeController.text.trim();

    String userName = _userNameController.text.trim();

    String numberWithCountryCode = countryCode + number;
    PhoneValid phoneValid =
        await CustomValidator.isPhoneValid(numberWithCountryCode);
    numberWithCountryCode = phoneValid.phone;

    if (_formKeySignUp!.currentState!.validate()) {
      if (firstName.isEmpty) {
        showCustomSnackBar('enter_your_first_name'.tr);
      } else if (lastName.isEmpty) {
        showCustomSnackBar('enter_your_last_name'.tr);
      } else if (email.isEmpty) {
        showCustomSnackBar('enter_email_address'.tr);
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('enter_a_valid_email_address'.tr);
      } else if (number.isEmpty) {
        showCustomSnackBar('enter_phone_number.tr');
      } else if (!phoneValid.isValid) {
        showCustomSnackBar('invalid_phone_number'.tr);
      } else if (password.isEmpty) {
        showCustomSnackBar('enter_password'.tr);
      } else if (password.length < 8) {
        showCustomSnackBar('password_should_be_8_characters'.tr);
      } else if (password != confirmPassword) {
        showCustomSnackBar('confirm_password_does_not_matched'.tr);
      } else if (userName.isEmpty) {
        showCustomSnackBar('enter_user_name'.tr);
      } else if (referCode.isEmpty) {
        showCustomSnackBar('invalid_refer_code'.tr);
      } else {
        SignUpBodyModel signUpBody = SignUpBodyModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: numberWithCountryCode,
          password: password,
          refCode: referCode,
          gender: "Male",
          username: userName,
        );

        return signUpBody;
      }
    }
    return null;
  }
}
