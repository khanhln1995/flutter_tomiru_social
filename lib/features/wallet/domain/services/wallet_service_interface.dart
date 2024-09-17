import 'package:tomiru_social_flutter/features/splash/domain/models/config_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../models/wallet_history_model.dart';

abstract class WalletServiceInterface {
  Future<List<WalletHistoryModel>> fetchWalletHistory();
  Future<List<WalletHistoryModel>> getWalletHistoryLocal();

  Future<void> userCheckin();
  Future<void> requestOTP();
  Future<Response> sendToken(SendTokenModel data);
  void saveInfoLocal(String email);
  Future<List<String>> getEmailListLocal();
  Future<List<WalletHistoryModel>> fetchWalletHistoryByDate(String? page);
}
