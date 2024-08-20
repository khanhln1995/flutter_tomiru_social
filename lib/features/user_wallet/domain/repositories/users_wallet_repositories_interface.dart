import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/wallet_history_model.dart';


abstract class UsersWalletRepositoryInterface extends RepositoryInterface {

  Future<List<WalletHistoryModel>>fetchWalletHistory();
  Future<List<WalletHistoryModel>>getWalletHistoryLocal();

  Future<String>userCheckin();

}
