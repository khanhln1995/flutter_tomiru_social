import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo_interface.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class BusinessRepo implements BusinessRepoInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  BusinessRepo({required this.sharedPreferences, required this.apiClient});

  @override
  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.notification) ?? true;
  }

  @override
  Future<List<VaultInfo>> getVaultInfo() async {
    Response response = await apiClient.getData(AppConstants.apiV1VaultInfo);
    if (response.statusCode == 200) {
      List<dynamic> dataList = response.body['data'];
      List<VaultInfo> vaultInfoList =
          dataList.map((json) => VaultInfo.fromJson(json)).toList();
      return vaultInfoList;
    } else {
      throw Exception('errors: ${response.statusText}');
    }
  }

  @override
  Future<List<WalletInfo>> getWalletInfo() async {
    Response response =
        await apiClient.getData(AppConstants.apiV1UsersWalletHistory);
    if (response.statusCode == 200) {
      List<dynamic> dataList = response.body['data'];
      List<WalletInfo> walletInfoList =
          dataList.map((json) => WalletInfo.fromJson(json)).toList();

      return walletInfoList;
    } else {
      throw Exception('errors: ${response.statusText}');
    }
  }

  @override
  Future<List<PackagesAvailable>> getPackages() async {
    Response response =
        await apiClient.getData(AppConstants.apiV1UsersPackages);
    if (response.statusCode == 200) {
      List<dynamic> dataList = response.body['data'].packages;
      List<PackagesAvailable> packagesList =
          dataList.map((json) => PackagesAvailable.fromJson(json)).toList();
      return packagesList;
    } else {
      throw Exception('errors: ${response.statusText}');
    }
  }

  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    throw UnimplementedError();
  }

  @override
  Future getList({int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    throw UnimplementedError();
  }
}
