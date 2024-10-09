import 'dart:convert';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/api/api_social.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/models/search_terms_request.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/repositories/social_search_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/util/social_endpoint.dart';

class SocialSearchRepository implements SocialSearchRepositoryInterface {
  final ApiSocial apiSocial;
  final SharedPreferences sharedPreferences;
  SocialSearchRepository(
      {required this.apiSocial, required this.sharedPreferences});

  @override
  Future<List<User>> getUsersByUserName(String userName, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_SEARCH_USER
          .replaceAll('{name}', userName.toString())
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
  Future<List<Tweet>> getTweetsByTagName(String tag) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_SEARCH_TAG
          .replaceAll('{tagName}', tag.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<Tweet> tweets =
              data.map((tweet) => Tweet.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(tweets)}");
          return tweets;
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
  Future<List<Tweet>> getTweetsByText(String text, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_SEARCH_TEXT
          .replaceAll('{text}', text.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<Tweet> tweets =
              data.map((tweet) => Tweet.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(tweets)}");
          return tweets;
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
  Future<CommonUser> getRelevantUsers(SearchTermsRequest request) async {
    try {
      Response response = await apiSocial.postData(
          SocialEndpoint.UI_V1_USER_SEARCH_RESULTS, request);

      if (response.statusCode == 200) {
        CommonUser tweets = CommonUser.fromJson(response.body);

        return tweets;
      } else {
        throw Exception("Failed to load tweets");
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
