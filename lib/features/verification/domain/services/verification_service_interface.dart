import 'package:tomiru_social_flutter/common/models/response_model.dart';

abstract class VerificationServiceInterface {
  Future<ResponseModelWithBody> forgetPassword(String? email);
  Future<ResponseModel> verifyToken(String? phone, String verificationCode);
  Future<ResponseModel> resetPassword(String? resetToken, String number,
      String password, String confirmPassword);
  Future<ResponseModel> checkEmail(String email);
  Future<ResponseModel> verifyEmail(
      String email, String token, String verificationCode);
  Future<ResponseModel> verifyPhone(
      String? phone, String? token, String verificationCode);
  Future<ResponseModel> forgotConfirmOTP(String email, String otp);
  Future<ResponseModel> sigupConfirmOTP(String email, String otp);
}
