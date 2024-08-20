import 'package:tomiru_social_flutter/features/wallet/domain/models/fund_bonus_model.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/wallet_model.dart';

abstract class WalletServiceInterface {
  Future<WalletModel?> getWalletTransactionList(
      String offset, String sortingType);
  Future<void> addFundToWallet(double amount, String paymentMethod);
  Future<List<FundBonusModel>?> getWalletBonusList();
  Future<void> setWalletAccessToken(String token);
  String getWalletAccessToken();
  Future<void> getUserWallet();
}
