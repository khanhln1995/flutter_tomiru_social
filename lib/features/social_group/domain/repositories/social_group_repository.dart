import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/api/api_social.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/models/group.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/repositories/social_group_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/util/social_endpoint.dart';

class SocialGroupRepository implements SocialGroupRepositoryInterface {
  final ApiSocial apiSocial;
  final SharedPreferences sharedPreferences;
  SocialGroupRepository(
      {required this.apiSocial, required this.sharedPreferences});

  @override
  Future<GroupModel> createGroup(GroupModel request) async {
    try {
      Response response =
          await apiSocial.postData(SocialEndpoint.UI_V1_GROUP, request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        GroupModel group = GroupModel.fromJson(response.body);
        print("Response JSON: ${jsonEncode(group)}");
        return group;
      } else {
        throw Exception("Failed to load group");
      }
    } catch (e) {
      throw Exception("Error fetching group: $e");
    }
  }

  @override
  Future<GroupModel> getGroupById(int id) async {
    try {
      Response response = await apiSocial.getData(
          SocialEndpoint.UI_V1_GROUP_ID.replaceAll('{groupId}', id.toString()));

      if (response.statusCode == 200 || response.statusCode == 201) {
        GroupModel group = GroupModel.fromJson(response.body);
        return group;
      } else {
        throw Exception(response.body['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GroupModel> editGroup(GroupModel request) async {
    try {
      Response response =
          await apiSocial.putData(SocialEndpoint.UI_V1_GROUP, request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        GroupModel group = GroupModel.fromJson(response.body);
        print("Response JSON: ${jsonEncode(group)}");
        return group;
      } else {
        throw Exception("Failed to load group");
      }
    } catch (e) {
      throw Exception("Error fetching group: $e");
    }
  }

  @override
  Future<ResponseModel> deleteGroup(int id) async {
    Response response = await apiSocial.deleteData(
        SocialEndpoint.UI_V1_GROUP_ID.replaceAll('{groupId}', id.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> requestJoinGroup(int id) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_REQUEST_JOIN
            .replaceAll('{groupId}', id.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //admin chấp nhận lời mời vào group
  Future<ResponseModel> acceptJoinGroup(
      AcceptUserToGroupRequest request) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_PENDING_USERS_ACCEPT, request);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //admin xoá người dùng
  Future<ResponseModel> removeMemberGroup(int groupId, int memberId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_PENDING_USERS_ACCEPT
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', memberId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //admin block
  Future<ResponseModel> blockUserGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_BLOCK
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //admin bỏ block
  Future<ResponseModel> unblockUserGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_UNBLOCK
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //admin từ chối lời mời vào
  Future<ResponseModel> rejectGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_REJECT
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //thăng chức
  Future<ResponseModel> assignGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_ASSIGN
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //giáng chức
  Future<ResponseModel> demotedGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_DEMOTED
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  //chuyển chức trưởng nhóm
  Future<ResponseModel> transferRightsGroup(int groupId, int userId) async {
    Response response = await apiSocial.postData(
        SocialEndpoint.UI_V1_GROUP_TRANSFER_RIGHTS
            .replaceAll('{groupId}', groupId.toString())
            .replaceAll('{userId}', userId.toString()),
        {});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<List<GroupModel>> suggestGroup(int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_SUGGEST
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<GroupModel> groups =
              data.map((tweet) => GroupModel.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(groups)}");
          return groups;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load groups");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<GroupModel>> getGroupByUserId(int userId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_USER
          .replaceAll('{userId}', userId.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<GroupModel> groups =
              data.map((tweet) => GroupModel.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(groups)}");
          return groups;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load groups");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<User>> getMemberGroup(int groupId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_MEMBER
          .replaceAll('{groupId}', groupId.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<User> users = data.map((tweet) => User.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<User>> getPendingMemberGroup(int groupId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_PENDING_MEMBER
          .replaceAll('{groupId}', groupId.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<User> users = data.map((tweet) => User.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<User>> getBlockedUserGroup(int groupId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_BLOCKED_MEMBER
          .replaceAll('{groupId}', groupId.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<User> users = data.map((tweet) => User.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<GroupModel>> searchGroupByUserName(
      String groupName, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_GROUP_SEARCH_GROUP
          .replaceAll('{groupName}', groupName.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<GroupModel> groups =
              data.map((tweet) => GroupModel.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(groups)}");
          return groups;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load groups");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
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
