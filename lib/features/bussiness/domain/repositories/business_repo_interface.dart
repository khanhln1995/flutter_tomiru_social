import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class BusinessRepoInterface extends RepositoryInterface {
  bool isNotificationActive();
  Future<List<VaultInfo>> getVaultInfo();
   Future<List<WalletInfo>> getWalletInfo();
   Future<List<WalletInfo>> getWalletInfoByFilter(
      {Map<String, String>? filters});


  Future<TreeResponse> fetchTernaryTreeDetail({Map<String, String>? filters});
  Future<TreeResponse> fetchTernaryTree();
  Future<Packages> getPackages();
  Future<Response> buyPackage(String? packageName);
}
