import 'package:tomiru_social_flutter/features/splash/domain/models/config_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../models/wallet_history_model.dart';



abstract class UsersWalletServiceInterface {
  Future<List<WalletHistoryModel>>fetchWalletHistory();
  Future<List<WalletHistoryModel>>getWalletHistoryLocal();

  Future<void>userCheckin();
}
