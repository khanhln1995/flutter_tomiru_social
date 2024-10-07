import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/jwt_tokens_model.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/signup_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/social_log_in_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service_interface.dart';
import 'package:tomiru_social_flutter/features/profile/domain/models/selfinfo_model.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/splash/screens/splash_screen.dart';
import 'package:tomiru_social_flutter/features/users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthServiceInterface authServiceInterface;
  AuthController({required this.authServiceInterface}) {
    _notification = authServiceInterface.isNotificationActive();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final bool _guestLoading = false;
  bool get guestLoading => _guestLoading;

  bool _acceptTerms = true;
  bool get acceptTerms => _acceptTerms;

  bool _isActiveRememberMe = false;
  bool get isActiveRememberMe => _isActiveRememberMe;

  bool _notification = true;
  bool get notification => _notification;

  String _jwtToken = '';
  String get jwtToken => _jwtToken;
  String _jwtTokenShop = '';
  String get jwtTokenShop => _jwtTokenShop;
  String _jwtTokenSocial = '';
  String get jwtTokenSocial => _jwtTokenSocial;

  Future<ResponseModel> login(String? email, String? password,
      {bool alreadyInApp = false}) async {
    _isLoading = true;
    update();
    await authServiceInterface.clearTokens();
    ResponseModel responseModel =
        await authServiceInterface.login(email: email, password: password);
    if (responseModel.isSuccess) {
      getTokens();
      Get.find<UsersProfileController>().setCurrentUsers();
      Get.to(SplashScreen(isRouterLogin: true));
    } else {
      showCustomSnackBar(responseModel.message);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> logout() async {
    _isLoading = true;
    update();
    _jwtToken = '';
    _jwtTokenShop = '';
    _jwtTokenSocial = '';
    Get.offNamed(RouteHelper.getSignInRoute("sign-in"));
    ResponseModel responseModel = await authServiceInterface.logout();
    // if (responseModel.isSuccess) {
    //   _jwtToken = '';
    //   _jwtTokenShop = '';
    //   _jwtTokenSocial = '';
    //   Get.offNamed(RouteHelper.getSignInRoute("sign-in"));
    // }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModelWithBody> registration(
      SignUpBodyModel signUpModel) async {
    _isLoading = true;
    update();
    ResponseModelWithBody responseModel =
        await authServiceInterface.registration(signUpModel,
            Get.find<SplashController>().configModel!.customerVerification!);
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password
      // , String countryCode
      ) {
    authServiceInterface.saveUserNumberAndPassword(number, password
        // , countryCode
        );
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authServiceInterface.clearUserNumberAndPassword();
  }

  void toggleTerms() {
    _acceptTerms = !_acceptTerms;
    update();
  }

  String getUserEmail() {
    return authServiceInterface.getUserEmail();
  }

  String getUserPassword() {
    return authServiceInterface.getUserPassword();
  }

  SelfInfoModel? getUserSelfInfo() {
    final res1 = authServiceInterface.getUserSelfInfo();
    return res1;
  }

  void toggleRememberMe() {
    _isActiveRememberMe = true;
    update();
  }

  Future<void> loginWithSocialMedia(
      SocialLogInBodyModel socialLogInBody) async {
    _isLoading = true;
    update();
    await authServiceInterface.loginWithSocialMedia(socialLogInBody,
        isCustomerVerificationOn:
            Get.find<SplashController>().configModel!.customerVerification!);
    _isLoading = false;
    update();
  }

  Future<void> registerWithSocialMedia(
      SocialLogInBodyModel socialLogInModel) async {
    _isLoading = true;
    update();
    await authServiceInterface.registerWithSocialMedia(socialLogInModel,
        isCustomerVerificationOn:
            Get.find<SplashController>().configModel!.customerVerification!);
    _isLoading = false;
    update();
  }

  Future<void> updateToken() async {
    await authServiceInterface.updateToken();
  }

  bool isLoggedIn() {
    return authServiceInterface.isLoggedIn();
  }

  String getGuestId() {
    return authServiceInterface.getGuestId();
  }

  bool isGuestLoggedIn() {
    return authServiceInterface.isGuestLoggedIn() &&
        !authServiceInterface.isLoggedIn();
  }

  void saveDmTipIndex(String i) {
    authServiceInterface.saveDmTipIndex(i);
  }

  String getDmTipIndex() {
    return authServiceInterface.getDmTipIndex();
  }

  Future<void> socialLogout() async {
    await authServiceInterface.socialLogout();
  }

  Future<bool> clearSharedData({bool removeToken = true}) async {
    return await authServiceInterface.clearSharedData(removeToken: removeToken);
  }

  bool setNotificationActive(bool isActive) {
    _notification = isActive;
    authServiceInterface.setNotificationActive(isActive);
    update();
    return _notification;
  }

  String getUserToken() {
    return authServiceInterface.getUserToken();
  }

  Future<void> saveGuestNumber(String number) async {
    authServiceInterface.saveGuestNumber(number);
  }

  String getGuestNumber() {
    return authServiceInterface.getGuestNumber();
  }

  void getTokens() {
    JwtTokenModel? tokens = authServiceInterface.getTokens();
    _jwtToken = tokens!.token;
    _jwtTokenShop = tokens.shop;
    _jwtTokenSocial = tokens.social;
  }
}
