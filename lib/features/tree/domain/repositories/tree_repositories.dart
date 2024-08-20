import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/features/tree/domain/repositories/tree_repositories_interface.dart';
import '../../../../api/api_client.dart';
import '../../../../util/app_constants.dart';
import '../models/tree_response_model.dart';
class TreeRepository implements TreeRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TreeRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<TreeResponse> fetchTernaryTree() async {
      Response response = await apiClient.getData(AppConstants.apiV1TernaryTree);
      if (response.statusCode == 200) {
        final treeResponse = TreeResponse.fromJson(response.body['data']);
        return treeResponse;
      } else {
        throw Exception("Failed to fetch user data: ${response.statusText}");
      }
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






}
