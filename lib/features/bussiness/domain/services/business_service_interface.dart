import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';

abstract class BusinessServiceInterface {
  bool isNotificationActive();
  Future<List<VaultInfo>> getVaultInfo();
  Future<List<WalletInfo>> getWalletInfo();
  Future<Packages> getPackages();
  Future<ResponseModel> buyPackage(String? packageName);
}
