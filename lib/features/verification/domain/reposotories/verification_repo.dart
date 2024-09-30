import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/features/verification/domain/reposotories/verification_repo_interface.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationRepo implements VerificationRepoInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  VerificationRepo({required this.sharedPreferences, required this.apiClient});

  @override
  Future<ResponseModelWithBody> forgetPassword(String? email) async {
    Response response = await apiClient.postData(
        AppConstants.forgetPasswordUri, {"email": email},
        handleError: false);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModelWithBody(
          true, response.body["message"], response.body);
    } else {
      return ResponseModelWithBody(false, response.statusText, response.body);
    }
  }

  @override
  Future<ResponseModel> verifyToken(String? phone, String token) async {
    Response response = await apiClient.postData(
        AppConstants.verifyTokenUri, {"phone": phone, "reset_token": token},
        handleError: false);
    if (response.statusCode == 200) {
      return ResponseModel(true, response.body["message"]);
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    Response response = await apiClient.postData(
      AppConstants.resetPasswordUri,
      {
        "_method": "put",
        "reset_token": resetToken,
        "phone": number,
        "password": password,
        "confirm_password": confirmPassword
      },
      handleError: false,
    );
    if (response.statusCode == 200) {
      return ResponseModel(true, response.body["message"]);
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> checkEmail(String email) async {
    Response response = await apiClient.postData(
        AppConstants.checkEmailUri, {"email": email},
        handleError: false);
    if (response.statusCode == 200) {
      return ResponseModel(true, response.body["token"]);
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<Response> verifyEmail(String email, String token) async {
    return await apiClient.postData(
        AppConstants.verifyEmailUri, {"email": email, "token": token},
        handleError: false);
  }

  @override
  Future<Response> verifyPhone(String? phone, String otp) async {
    return await apiClient.postData(
        AppConstants.verifyPhoneUri, {"phone": phone, "otp": otp},
        handleError: false);
  }

  @override
  Future<Response> forgotConfirmOTP(String? email, String otp) async {
    return await apiClient.postData(
        AppConstants.forgotConfirmOtpUri, {"email": email, "codeOtp": otp},
        handleError: false);
  }
  @override
  Future<Response> sigupConfirmOTP(String? email, String otp) async {
    return await apiClient.postData(
        AppConstants.sigupConfirmOtpUri, {"email": email, "otp": otp},
        handleError: false);
  }

  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    throw UnimplementedError();
  }

  @override
  Future getList({int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    throw UnimplementedError();
  }
}
