import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/repositories/wallet_repository_interface.dart';

import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../models/wallet_history_model.dart';

class WalletRepository implements WalletRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  WalletRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<List<WalletHistoryModel>> fetchWalletHistory() async {
    Response response =
        await apiClient.getData(AppConstants.apiV1UsersWalletHistory);
    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      List<WalletHistoryModel> walletHistoryList = data.map((item) {
        return WalletHistoryModel.fromJson(item);
      }).toList();
      List<Map<String, dynamic>> walletHistoryJsonList =
          walletHistoryList.map((item) {
        return item.toJson();
      }).toList();
      String walletHistoryJson = jsonEncode(walletHistoryJsonList);
      await sharedPreferences.setString(
          AppConstants.walletHistory, walletHistoryJson);
      return walletHistoryList;
    } else {
      throw Exception("Failed to fetch wallet history: ${response.statusText}");
    }
  }

  @override
  Future<List<WalletHistoryModel>> fetchWalletHistoryByDate(String? page) async {
    Response response =
        await apiClient.getData('${AppConstants.apiV1UsersWalletHistory}?order=createdAt:DESC&limit=10&page=$page');
    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      List<WalletHistoryModel> walletHistoryList = data.map((item) {
        return WalletHistoryModel.fromJson(item);
      }).toList();
      // List<Map<String, dynamic>> walletHistoryJsonList =
      //     walletHistoryList.map((item) {
      //   return item.toJson();
      // }).toList();
      // String walletHistoryJson = jsonEncode(walletHistoryJsonList);
      // await sharedPreferences.setString(
      //     AppConstants.walletHistory, walletHistoryJson);
      return walletHistoryList;
    } else {
      throw Exception("Failed to fetch wallet history: ${response.statusText}");
    }
  }

  @override
  Future<List<WalletHistoryModel>> getWalletHistoryLocal() async {
    String? walletHistoryJson =
        sharedPreferences.getString(AppConstants.walletHistory);
    if (walletHistoryJson != null) {
      List<dynamic> data = jsonDecode(walletHistoryJson);
      List<WalletHistoryModel> walletHistoryList = data.map((item) {
        return WalletHistoryModel.fromJson(item);
      }).toList();
      return walletHistoryList;
    } else {
      return [];
    }
  }

  @override
  Future<String> userCheckin() async {
    try {
      Response response =
          await apiClient.postData(AppConstants.apiV1UsersCheckIn, {});

      if (response.statusCode == 200) {
        //thêm thông báo thành công
        return "";
      } else {
        return response.body['error']['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> requestOTP() async {
    return await apiClient.postData(AppConstants.requestOTPUri, {});
  }

  @override
  Future<Response> sendToken(SendTokenModel data) async {
    Map<String, dynamic> body = data.toJson();

    return await apiClient.postData(AppConstants.apiV1UsersSendCoin, body);
  }

  @override
  Future add(value) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future getList({int? offset}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  void saveInfoLocal(String email) async {
    List<String> emailList = [];
    String? emailListJson =
        sharedPreferences.getString(AppConstants.emailListKey);

    if (emailListJson != null) {
      emailList = List<String>.from(jsonDecode(emailListJson));
    }
    emailList.add(email);
    if (emailList.length > 10) {
      emailList.removeAt(0);
    }
    String updatedEmailListJson = jsonEncode(emailList);

    await sharedPreferences.setString(
        AppConstants.emailListKey, updatedEmailListJson);
  }

  Future<List<String>> getEmailListLocal() async {
    String? emailListJson =
        sharedPreferences.getString(AppConstants.emailListKey);
    if (emailListJson != null) {
      List<dynamic> emailListDynamic = jsonDecode(emailListJson);
      List<String> emailList = List<String>.from(emailListDynamic);
      return emailList;
    } else {
      return [];
    }
  }
}
