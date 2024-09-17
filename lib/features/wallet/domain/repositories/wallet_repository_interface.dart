import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../models/wallet_history_model.dart';

abstract class WalletRepositoryInterface extends RepositoryInterface {
  Future<List<WalletHistoryModel>> fetchWalletHistory();
  Future<List<WalletHistoryModel>> getWalletHistoryLocal();
  Future<List<WalletHistoryModel>> fetchWalletHistoryByDate(String? page);

  Future<String> userCheckin();
  Future<Response> requestOTP();
  Future<Response> sendToken(SendTokenModel data);
  void saveInfoLocal(String email);
  Future<List<String>> getEmailListLocal();
}
