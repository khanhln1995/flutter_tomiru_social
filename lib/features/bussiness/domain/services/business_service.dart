import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';

class BusinessService implements BusinessServiceInterface {
  final BusinessRepoInterface businessRepoInterface;
  BusinessService({required this.businessRepoInterface});

  @override
  bool isNotificationActive() {
    return businessRepoInterface.isNotificationActive();
  }

  Future<List<VaultInfo>> getVaultInfo() {
    return businessRepoInterface.getVaultInfo();
  }
  @override
  Future<List<WalletInfo>> getWalletInfo() {
    return businessRepoInterface.getWalletInfo();
  }
}
