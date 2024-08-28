import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class BusinessService implements BusinessServiceInterface {
  final BusinessRepoInterface businessRepoInterface;
  BusinessService({required this.businessRepoInterface});

  @override
  bool isNotificationActive() {
    return businessRepoInterface.isNotificationActive();
  }

  @override
  Future<List<VaultInfo>> getVaultInfo() {
    return businessRepoInterface.getVaultInfo();
  }

  @override
  Future<Packages> getPackages() {
    return businessRepoInterface.getPackages();
  }

  @override
  Future<List<WalletInfo>> getWalletInfo() {
    return businessRepoInterface.getWalletInfo();
  }

  @override
  Future<TreeResponse> fetchTernaryTree() async {
    return await businessRepoInterface.fetchTernaryTree();
  }
  @override
  Future<TreeResponse> fetchTernaryTreeDetail(
      {Map<String, String>? filters}) async {
    return await businessRepoInterface.fetchTernaryTreeDetail(filters:filters);
  }

  @override
  Future<List<WalletInfo>> getWalletInfoByFilter(
      {Map<String, String>? filters}) {
    return businessRepoInterface.getWalletInfoByFilter(filters: filters);
  }

  @override
  Future<ResponseModel> buyPackage(String? packageName) async {
    Response response = await businessRepoInterface.buyPackage(packageName);
    if (response.statusCode == 201 && response.body['data']) {
      return ResponseModel(true, response.body['message']);
    } else {
      return ResponseModel(false, response.statusText);
    }
  }
}
