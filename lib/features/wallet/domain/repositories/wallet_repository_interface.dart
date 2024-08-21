import 'package:tomiru_social_flutter/features/wallet/domain/models/fund_bonus_model.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/wallet_model.dart';
import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class WalletRepositoryInterface extends RepositoryInterface {
  @override
  Future<WalletModel?> getList({int? offset, String sortingType});
  Future<Response> addFundToWallet(double amount, String paymentMethod);
  Future<List<FundBonusModel>?> getWalletBonusList();
  Future<void> setWalletAccessToken(String token);
  String getWalletAccessToken();
  Future<void> getUserWallet();
}
