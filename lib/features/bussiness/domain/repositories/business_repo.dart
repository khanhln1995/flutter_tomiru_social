import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
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
  Future<List<WalletInfo>> getWalletInfoByFilter(
      {Map<String, String>? filters}) async {
    
     // Start with the base URL
    String url = AppConstants.apiV1UsersWalletHistory;

    // If filters are provided, append them to the URL
    if (filters != null && filters.isNotEmpty) {
      // Create a query string from the filters map
      String queryString = filters.entries.map((entry) {
        // Use Uri.encodeQueryComponent to ensure proper encoding
        return '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeQueryComponent(entry.value)}';
      }).join('&');

      // Append the query string to the URL
      url += '&$queryString';
    }
    //    print("Đây là bussiness repo");
    // print(url);
    // Make the API request with the updated URL
    Response response = await apiClient.getData(url);
    
    // Handle the response
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
  Future<Packages> getPackages() async {
    Response response =
        await apiClient.getData(AppConstants.apiV1UsersPackages);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final packageResponse = Packages.fromJson(response.body['data']);
      return packageResponse;
    } else {
      throw Exception('errors: ${response.statusText}');
    }
  }

  @override
  Future<TreeResponse> fetchTernaryTree() async {
    Response response = await apiClient.getData(AppConstants.apiV1TernaryTree);
    if (response.statusCode == 200) {
      final treeResponse = TreeResponse.fromJson(response.body);
      return treeResponse;
    } else {
      throw Exception("Failed to fetch user data: ${response.statusText}");
    }
  }
  @override
  Future<TreeResponse> fetchTernaryTreeDetail(
      {Map<String, String>? filters}) async {
    // Response response = await apiClient.getData(AppConstants.apiV1TernaryTreeUsername);
     String url = AppConstants.apiV1TernaryTreeUsername;
    if (filters != null && filters.isNotEmpty) {
      String queryString = filters.entries.map((entry) {
        return '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeQueryComponent(entry.value)}';
      }).join('?');

      url += '?$queryString';
    }
       print("Đây là bussiness repo");
    print(url);
    // Make the API request with the updated URL
    Response response = await apiClient.getData(url);

    if (response.statusCode == 200) {
      final treeResponse = TreeResponse.fromJson(response.body);
      // print("Đây là business repo fetch tree");
      // print(treeResponse);
      return treeResponse;
    } else {
      throw Exception("Failed to fetch user data: ${response.statusText}");
    }
  }

  @override
  Future<Response> buyPackage(String? packageName) async {
    return await apiClient.postData(
        AppConstants.apiV1UsersBuyPackages, {"packageName": packageName},
        handleError: false);
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
