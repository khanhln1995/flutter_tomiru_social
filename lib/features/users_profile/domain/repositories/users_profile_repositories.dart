import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/master_data_models.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/repositories/users_profile_repositories_intrerface.dart';

import '../../../../api/api_client.dart';
import '../../../../util/app_constants.dart';
import '../models/users_me.dart';

class UsersProfileRepository implements UsersProfileRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UsersProfileRepository(
      {required this.apiClient, required this.sharedPreferences});

  @override
  Future<UserProfile> fetchCurrentUsers() async {
    Response response = await apiClient.getData(AppConstants.apiV1UsersMe);
    if (response.statusCode == 200) {
      final userProfile = UserProfile.fromJson(response.body['data']);
      String userProfileJson = jsonEncode(userProfile.toJson());
      await sharedPreferences.setString(
          AppConstants.userProfile, userProfileJson);

      List<dynamic> usersBalancesJson = response.body['data']['usersBalances'];
      List<UserBalance> usersBalances = usersBalancesJson
          .map((balance) => UserBalance.fromJson(balance))
          .toList();
      String usersBalancesJsonString =
          jsonEncode(usersBalances.map((balance) => balance.toJson()).toList());
      await sharedPreferences.setString(
          AppConstants.usersBalances, usersBalancesJsonString);

      return userProfile;
    } else {
      throw Exception("Failed to fetch user data: ${response.statusText}");
    }
  }

  @override
  Future<UserProfile> getCurrentUsersLocal() async {
    String? userProfileJson =
        sharedPreferences.getString(AppConstants.userProfile);

    if (userProfileJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userProfileJson);
      final userProfile = UserProfile.fromJson(userMap);
      return userProfile;
    } else {
      throw Exception("No user data found in local storage.");
    }
  }

  @override
  Future<List<UserBalance>> getUsersBalancesLocal() async {
    String? usersBalancesJson =
        sharedPreferences.getString(AppConstants.usersBalances);

    if (usersBalancesJson != null) {
      List<dynamic> usersBalancesList = jsonDecode(usersBalancesJson);
      List<UserBalance> usersBalances =
          usersBalancesList.map((item) => UserBalance.fromJson(item)).toList();
      return usersBalances;
    } else {
      throw Exception("No user data found in local storage.");
    }
  }

  @override
  Future<MasterDataModel> fetchMasterData() async {
    Response response = await apiClient.getData(AppConstants.apiV1MasterData);
    if (response.statusCode == 200) {
      final masterData = MasterDataModel.fromJson(response.body['data']);
      String dataJson = jsonEncode(masterData.toJson());
      await sharedPreferences.setString(AppConstants.masterData, dataJson);

      return masterData;
    } else {
      throw Exception("Failed to fetch user data: ${response.statusText}");
    }
  }

  @override
  Future<MasterDataModel> getMasterDataLocal() async {
    String? masterDataJson =
        sharedPreferences.getString(AppConstants.masterData);

    if (masterDataJson != null) {
      Map<String, dynamic> data = jsonDecode(masterDataJson);
      final masterData = MasterDataModel.fromJson(data);
      return masterData;
    } else {
      throw Exception("No user data found in local storage.");
    }
  }

//
  @override
  Future<List<UserBalance>> getUsersBalances() async {
    // print(AppConstants.apiV1UsersMe);

    Response response = await apiClient.getData(AppConstants.apiV1UsersMe);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.body['data'];
      List<dynamic> dataList = data['usersBalances'];
      //  print("Đây là user profile repo");
      // print(dataList);

      List<UserBalance> userBalance =
          dataList.map((json) => UserBalance.fromJson(json)).toList();

      return userBalance;
    } else {
      throw Exception('errors: ${response.statusText}');
    }
  }

//
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
}
