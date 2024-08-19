import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/signup_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/social_log_in_body_model.dart';
import 'package:tomiru_social_flutter/features/profile/domain/models/selfinfo_model.dart';

abstract class AuthServiceInterface {
  Future<ResponseModel> registration(
      SignUpBodyModel signUpModel, bool isCustomerVerificationOn);
  Future<ResponseModel> login(
      {
      // String? phone,
      String? email,
      String? password,
      bool customerVerification = false,
      bool alreadyInApp = false});
  // String getUserCountryCode();
  // String getUserNumber();
  String getUserPassword();
  String getUserEmail();
  SelfInfoModel? getUserSelfInfo();
  void saveUserNumberAndPassword(String number, String password
      // , String countryCode
      );
  Future<bool> clearUserNumberAndPassword();
  // Future<ResponseModel> guestLogin();
  Future<void> loginWithSocialMedia(SocialLogInBodyModel socialLogInModel,
      {bool isCustomerVerificationOn = false});
  Future<void> registerWithSocialMedia(SocialLogInBodyModel socialLogInModel,
      {bool isCustomerVerificationOn = false});
  Future<void> updateToken();
  void saveDmTipIndex(String i);
  String getDmTipIndex();
  bool isLoggedIn();
  String getGuestId();
  bool isGuestLoggedIn();
  Future<void> socialLogout();
  Future<bool> clearSharedData({bool removeToken = true});
  bool setNotificationActive(bool isActive);
  bool isNotificationActive();
  String getUserToken();
  Future<void> saveGuestNumber(String number);
  String getGuestNumber();
}
