import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/signup_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/social_log_in_body_model.dart';
import 'package:tomiru_social_flutter/features/profile/domain/models/selfinfo_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/reposotories/auth_repo_interface.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service_interface.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart'; //facebook login
import 'package:google_sign_in/google_sign_in.dart'; //google login
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tomiru_social_flutter/features/auth/domain/models/jwt_tokens_model.dart';

class AuthService implements AuthServiceInterface {
  final AuthRepoInterface authRepoInterface;
  AuthService({required this.authRepoInterface});

  @override
  Future<ResponseModelWithBody> registration(
      SignUpBodyModel signUpModel, bool isCustomerVerificationOn) async {
    Response response = await authRepoInterface.registration(signUpModel);
    print("response: ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (!isCustomerVerificationOn) {
        authRepoInterface.saveTokens(response.body);
        await authRepoInterface.updateToken();
        authRepoInterface.clearGuestId();
      }
      return ResponseModelWithBody(true, response.body["token"], response.body);
    } else {
      return ResponseModelWithBody(
          false, response.body["error"]["message"], response.body
      );
    }
  }

  @override
  Future<ResponseModel> login({
    String? email,
    String? password,
  }) async {
    Response response =
        await authRepoInterface.login(email: email, password: password);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'Đăng nhập thành công');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> logout() async {
    Response response = await authRepoInterface.logout();

    if (response.statusCode == 200) {
      return ResponseModel(true, 'Đăng xuất thành công');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<void> clearTokens() async {
    await authRepoInterface.clearTokens();
  }

  @override
  void saveUserNumberAndPassword(
    String email,
    String password,
    //  String countryCode
  ) {
    authRepoInterface.saveUserNumberAndPassword(email, password
        // , countryCode
        );
  }

  @override
  Future<bool> clearUserNumberAndPassword() async {
    return authRepoInterface.clearUserNumberAndPassword();
  }

  @override
  String getUserCountryCode() {
    return authRepoInterface.getUserCountryCode();
  }

  @override
  String getUserEmail() {
    return authRepoInterface.getUserEmail();
  }

  @override
  String getUserNumber() {
    return authRepoInterface.getUserNumber();
  }

  @override
  String getUserPassword() {
    return authRepoInterface.getUserPassword();
  }

  @override
  SelfInfoModel? getUserSelfInfo() {
    return authRepoInterface.getUserSelfInfo();
  }

  @override
  JwtTokenModel? getTokens() {
    return authRepoInterface.getTokens();
  }

  @override
  Future<void> loginWithSocialMedia(SocialLogInBodyModel socialLogInModel,
      {bool isCustomerVerificationOn = false}) async {
    Response response =
        await authRepoInterface.loginWithSocialMedia(socialLogInModel);
    if (response.statusCode == 200) {
      String? token = response.body['token'];
      if (token != null && token.isNotEmpty) {
        if (isCustomerVerificationOn &&
            response.body['is_phone_verified'] == 0) {
          Get.toNamed(RouteHelper.getVerificationRoute(
            response.body['phone'] ?? socialLogInModel.email,
            token,
            RouteHelper.signUp,
          ));
        } else {
          authRepoInterface.saveTokens(response.body);
          await authRepoInterface.updateToken();
          authRepoInterface.clearGuestId();
          Get.toNamed(RouteHelper.getAccessLocationRoute('sign-in'));
        }
      } else {
        // Get.toNamed(RouteHelper.getForgotPassRoute(true, socialLogInModel));
      }
    } else if (response.statusCode == 403 &&
        response.body['errors'][0]['code'] == 'email') {
      Get.toNamed(RouteHelper.getForgotPassRoute(true, socialLogInModel));
    }
  }

  @override
  Future<void> registerWithSocialMedia(SocialLogInBodyModel socialLogInModel,
      {bool isCustomerVerificationOn = false}) async {
    Response response =
        await authRepoInterface.registerWithSocialMedia(socialLogInModel);
    if (response.statusCode == 200) {
      String? token = response.body['token'];
      if (isCustomerVerificationOn && response.body['is_phone_verified'] == 0) {
        Get.toNamed(RouteHelper.getVerificationRoute(
            socialLogInModel.phone, token, RouteHelper.signUp));
      } else {
        authRepoInterface.saveTokens(response.body);
        await authRepoInterface.updateToken();
        authRepoInterface.clearGuestId();
        Get.toNamed(RouteHelper.getAccessLocationRoute('sign-in'));
      }
    }
  }

  @override
  Future<void> updateToken() async {
    await authRepoInterface.updateToken();
  }

  @override
  bool isLoggedIn() {
    return authRepoInterface.isLoggedIn();
  }

  @override
  String getGuestId() {
    return authRepoInterface.getGuestId();
  }

  @override
  bool isGuestLoggedIn() {
    return authRepoInterface.isGuestLoggedIn();
  }

  @override
  Position? getPosition() {
    return authRepoInterface.getPosition();
  }

  @override
  Future<bool> savePosition(Position position) {
    return authRepoInterface.savePosition(position);
  }

  ///TODO: This function need to remove from here , as it is order part.
  @override
  void saveDmTipIndex(String i) {
    authRepoInterface.saveDmTipIndex(i);
  }

  ///TODO: This function need to remove from here , as it is order part.
  @override
  String getDmTipIndex() {
    return authRepoInterface.getDmTipIndex();
  }

  @override
  Future<void> socialLogout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FacebookAuth.instance.logOut();
  }

  @override
  Future<bool> clearSharedData({bool removeToken = true}) async {
    return await authRepoInterface.clearSharedData(removeToken: removeToken);
  }

  @override
  bool setNotificationActive(bool isActive) {
    authRepoInterface.setNotificationActive(isActive);
    return isActive;
  }

  @override
  bool isNotificationActive() {
    return authRepoInterface.isNotificationActive();
  }

  @override
  String getUserToken() {
    return authRepoInterface.getUserToken();
  }

  @override
  Future<void> saveGuestNumber(String number) async {
    authRepoInterface.saveGuestContactNumber(number);
  }

  @override
  String getGuestNumber() {
    return authRepoInterface.getGuestContactNumber();
  }
}
