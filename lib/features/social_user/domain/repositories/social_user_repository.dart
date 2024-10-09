import 'dart:convert';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/api/api_social.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/blocked_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/friend_use_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/muted_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_setting_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_token_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/repositories/social_user_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/util/social_endpoint.dart';

class SocialUserRepository implements SocialUserRepositoryInterface {
  final ApiSocial apiSocial;
  final SharedPreferences sharedPreferences;
  SocialUserRepository(
      {required this.apiSocial, required this.sharedPreferences});

  @override
  Future<UserTokenResponse> getUserByToken() async {
    try {
      Response response =
          await apiSocial.getData(SocialEndpoint.UI_V1_USER_TOKEN);

      if (response.statusCode == 200) {
        UserTokenResponse user =
            UserTokenResponse.fromJson(response.body['user']);
        return user;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<UserProfileResponse> getUserById(int userId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_USER_ID
          .replaceAll('{userId}', userId.toString()));

      if (response.statusCode == 200) {
        UserProfileResponse user = UserProfileResponse.fromJson(response.body);
        return user;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<List<User>> getUsers(int page) async {
    try {
      Response response = await apiSocial.getData(
          SocialEndpoint.UI_V1_USER_ALL.replaceAll('{page}', page.toString()));

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
      throw Exception("Error fetching users: $e");
    }
  }

  @override
  Future<List<User>> getRelevantUsers() async {
    try {
      Response response =
          await apiSocial.getData(SocialEndpoint.UI_V1_USER_RELEVANT);

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
      throw Exception("Error fetching users: $e");
    }
  }

  @override
  Future<UserTokenResponse> updateUserProfile(EditUserRequest request) async {
    try {
      Response response =
          await apiSocial.putData(SocialEndpoint.UI_V1_USER_PROFILE, request);

      if (response.statusCode == 200) {
        UserTokenResponse user = UserTokenResponse.fromJson(response.body);
        return user;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<UserTokenResponse> updateUserAbout(EditAboutRequest request) async {
    try {
      Response response =
          await apiSocial.putData(SocialEndpoint.UI_V1_USER_ABOUT, request);

      if (response.statusCode == 200) {
        UserTokenResponse user = UserTokenResponse.fromJson(response.body);
        return user;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<UserDetailResponse> getUserDetails(int userId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_USER_ID
          .replaceAll('{userId}', userId.toString()));

      if (response.statusCode == 200) {
        UserDetailResponse user = UserDetailResponse.fromJson(response.body);
        return user;
      } else {
        throw Exception("Failed to load user");
      }
    } catch (e) {
      throw Exception("Error fetching user: $e");
    }
  }

  @override
  Future<List<FriendUser>> fetchListFriend(int userId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_LIST_FRIEND
          .replaceAll('{userId}', userId.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<FriendUser> users =
              data.map((tweet) => FriendUser.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error fetching users: $e");
    }
  }

  @override
  Future<List<BlockedUser>> getBlockList(int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_BLOCKED
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<BlockedUser> users =
              data.map((tweet) => BlockedUser.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  //block bỏ block
  Future<ResponseModel> processBlockList(int userId) async {
    Response response = await apiSocial.getData(SocialEndpoint
        .UI_V1_USER_BLOCKED_USER_ID
        .replaceAll('{userId}', userId.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<List<User>> getFollowers(int userId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_FOLLOWERS_USER_ID
          .replaceAll('{userId}', userId.toString())
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
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

  @override
  Future<List<User>> getFollowing(int userId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_FOLLOWING_USER_ID
          .replaceAll('{userId}', userId.toString())
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
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

//Follow bỏ Follow
  @override
  Future<ResponseModel> processFollow(int userId) async {
    Response response = await apiSocial.getData(SocialEndpoint
        .UI_V1_USER_FOLLOW_USER_ID
        .replaceAll('{userId}', userId.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<List<MutedUser>> getMutedList(int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_USER_FOLLOWING_USER_ID
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<MutedUser> users =
              data.map((tweet) => MutedUser.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(users)}");
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error fetching tweets: $e");
    }
  }

//mute bỏ mute
  @override
  Future<ResponseModel> processMutedList(int userId) async {
    Response response = await apiSocial.getData(SocialEndpoint
        .UI_V1_USER_FOLLOW_USER_ID
        .replaceAll('{userId}', userId.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, 'ok');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> processSubscribeToNotifications(int userId) async {
    Response response = await apiSocial.getData(SocialEndpoint
        .UI_V1_USER_SUBSCRIBE_USER_ID
        .replaceAll('{userId}', userId.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateUsername(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_USERNAME, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateEmail(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_USERNAME, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updatePhone(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_PHONE, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateCountry(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_COUNTRY, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateGender(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_GENDER, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateLanguage(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_LANGUAGE, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateDirectMessageRequests(
      UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_DIRECT, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updatePrivateProfile(
      UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_PRIVATE, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateColorScheme(UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_COLOR_SCHEME, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  Future<ResponseModel> updateBackgroundColor(
      UserSettingsRequest setting) async {
    Response response = await apiSocial.putData(
        SocialEndpoint.UI_V1_USER_SETTINGS_UPDATE_BACKGROUND_COLOR, setting);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, "ok");
    } else {
      return ResponseModel(false, response.statusText);
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
