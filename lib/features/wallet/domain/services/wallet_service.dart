import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/tomxu_status_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/services/wallet_service_interface.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../models/wallet_history_model.dart';
import '../repositories/wallet_repository_interface.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';

class WalletService implements WalletServiceInterface {
  final WalletRepositoryInterface walletRepositoryInterface;
  WalletService({required this.walletRepositoryInterface});

  @override
  Future<List<WalletHistoryModel>> fetchWalletHistory() async {
    return await walletRepositoryInterface.fetchWalletHistory();
  }

  @override
  Future<List<WalletHistoryModel>> fetchWalletHistoryByDate(String? page) async {
    return await walletRepositoryInterface.fetchWalletHistoryByDate(page);
  }

  @override
  Future<List<WalletHistoryModel>> getWalletHistoryLocal() async {
    return await walletRepositoryInterface.getWalletHistoryLocal();
  }

  @override
  Future<void> userCheckin() async {
    String response = await walletRepositoryInterface.userCheckin();
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print(response);
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }

  @override
  Future<void> requestOTP() async {
    Response response = await walletRepositoryInterface.requestOTP();
    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar('send OTP success'.tr, isError: false);
    } else {
      showCustomSnackBar(response.body['error']['message']);
    }
  }

  @override
  Future<Response> sendToken(SendTokenModel data) async {
    Response response = await walletRepositoryInterface.sendToken(data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      walletRepositoryInterface.saveInfoLocal(data.email);
      Get.to(const TomxuStatusScreen(
        isSuccess: true,
      ));
    } else {
      showCustomSnackBar(response.body['error']['message']);
      Get.to(const TomxuStatusScreen(
        isSuccess: false,
      ));
    }
    return response;
  }

  void saveInfoLocal(String email) {
    walletRepositoryInterface.saveInfoLocal(email);
  }

  Future<List<String>> getEmailListLocal() async {
    return await walletRepositoryInterface.getEmailListLocal();
  }
}
