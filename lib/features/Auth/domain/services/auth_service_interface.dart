import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/jwt_tokens_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/signup_body_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/social_log_in_body_model.dart';
import 'package:tomiru_social_flutter/features/profile/domain/models/selfinfo_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class AuthServiceInterface {
  Future<ResponseModelWithBody> registration(
      SignUpBodyModel signUpModel, bool isCustomerVerificationOn);
  Future<ResponseModel> login({String? email, String? password});
  Future<ResponseModel> logout();
  String getUserPassword();
  String getUserEmail();
  SelfInfoModel? getUserSelfInfo();
  JwtTokenModel? getTokens();
  Future<void> clearTokens();
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
  Future<bool> savePosition(Position position);
  Position? getPosition();
}
