import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/jwt_tokens_model.dart';
import 'package:tomiru_social_flutter/features/auth/domain/models/social_log_in_body_model.dart';
import 'package:tomiru_social_flutter/features/profile/domain/models/selfinfo_model.dart';
import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:geolocator/geolocator.dart';

abstract class AuthRepoInterface<SignUpModel>
    extends RepositoryInterface<SignUpModel> {
  Future<void> saveTokens(Map<String, dynamic> responseBody);
  JwtTokenModel? getTokens();
  Future<void> clearTokens();
  Future<Response> updateToken({String notificationDeviceToken = ''});
  Future<bool> clearGuestId();
  String getUserCountryCode();
  String getUserNumber();
  String getUserPassword();
  String getUserEmail();
  String getGuestId();
  SelfInfoModel? getUserSelfInfo();
  Future<Response> registration(SignUpModel signUpModel);
  Future<Response> login({String? email, String? password});
  Future<Response> logout();
  Future<void> saveUserNumberAndPassword(String email, String password);
  Future<bool> clearUserNumberAndPassword();
  Future<bool> saveGuestId(String id);
  bool isGuestLoggedIn();
  Future<Response> loginWithSocialMedia(SocialLogInBodyModel socialLogInModel);
  Future<Response> registerWithSocialMedia(
      SocialLogInBodyModel socialLogInModel);
  Future<bool> saveDmTipIndex(String index);
  String getDmTipIndex();
  bool isLoggedIn();
  Future<bool> clearSharedData({bool removeToken = true});
  bool isNotificationActive();
  void setNotificationActive(bool isActive);
  String getUserToken();
  Future<bool> saveGuestContactNumber(String number);
  String getGuestContactNumber();
  Future<void> saveSelfInfo(SelfInfoModel selfinfo_model);
  Future<bool> clearSelfInfo();
  Future<bool> savePosition(Position position);
  Position? getPosition();
}
