import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';

abstract class BusinessServiceInterface {
  bool isNotificationActive();
  Future<List<VaultInfo>> getVaultInfo();
   Future <List<WalletInfo>> getWalletInfo();
}