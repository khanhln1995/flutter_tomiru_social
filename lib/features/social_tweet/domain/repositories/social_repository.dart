import 'dart:convert';
import 'dart:io';
import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomiru_social_flutter/api/api_social.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/add_quote_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/reply_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/repositories/social_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/util/social_endpoint.dart';

class SocialRepository implements SocialRepositoryInterface {
  final ApiSocial apiSocial;
  final SharedPreferences sharedPreferences;
  SocialRepository({required this.apiSocial, required this.sharedPreferences});

  @override
  Future<List<Tweet>> getTweets(String page) async {
    try {
      Response response = await apiSocial.getData(
          SocialEndpoint.UI_V1_TWEETS.replaceAll('{page}', page.toString()));

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
  Future<Tweet> getTweetById(int id) async {
    try {
      Response response = await apiSocial
          .getData(SocialEndpoint.UI_V1_TWEETS_ID + id.toString());

      if (response.statusCode == 200) {
        Tweet tweet = Tweet.fromJson(response.body);
        return tweet;
      } else {
        throw Exception("Failed to load tweet");
      }
    } catch (e) {
      throw Exception("Error fetching tweet: $e");
    }
  }

  @override
  Future<List<Tweet>> getTweetsByUser(int userId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_USER_ID
          .replaceAll('{userId}', userId.toString())
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
  Future<Tweet> getPinnedTweetByUserId(int id) async {
    try {
      Response response = await apiSocial
          .getData(SocialEndpoint.UI_V1_PINNED_TWEET_USER_ID + id.toString());

      if (response.statusCode == 200) {
        Tweet tweet = Tweet.fromJson(response.body);
        return tweet;
      } else {
        throw Exception("Failed to load tweet");
      }
    } catch (e) {
      throw Exception("Error fetching tweet: $e");
    }
  }

  @override
  Future<List<Tweet>> getUserMediaTweets(int userId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_MEDIA_USER_ID
          .replaceAll('{userId}', userId.toString()));

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
  Future<List<TweetImageResponse>> getUserTweetImages(int userId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_IMAGES_USER_ID
          .replaceAll('{userId}', userId.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<TweetImageResponse> tweets =
              data.map((tweet) => TweetImageResponse.fromJson(tweet)).toList();
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
  Future<TweetAdditionalInfoResponse> getTweetAdditionalInfoById(
      int tweetId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_ID_INFO
          .replaceAll('{tweetId}', tweetId.toString()));

      if (response.statusCode == 200) {
        TweetAdditionalInfoResponse tweet =
            TweetAdditionalInfoResponse.fromJson(response.body);
        return tweet;
      } else {
        throw Exception("Failed to load tweet");
      }
    } catch (e) {
      throw Exception("Error fetching tweet: $e");
    }
  }

  @override
  Future<List<Tweet>> getRepliesByTweetId(int tweetId) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_ID_REPLIES
          .replaceAll('{tweetId}', tweetId.toString()));

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
  Future<List<Tweet>> getQuotesByTweetId(int tweetId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_ID_QUOTES
          .replaceAll('{tweetId}', tweetId.toString())
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
  Future<List<Tweet>> getFollowersTweets(int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_FOLLOWER
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
  Future<ResponseModelWithBody> createTweet(TweetRequest tweet) async {
    Response response =
        await apiSocial.postData(SocialEndpoint.UI_V1_TWEETS_CREATE, tweet);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModelWithBody(
          true, response.body["message"], response.body);
    } else {
      return ResponseModelWithBody(false, response.statusText, response.body);
    }
  }

  @override
  Future<ResponseModelWithBody> editTweet(TweetRequest tweet) async {
    Response response =
        await apiSocial.putData(SocialEndpoint.UI_V1_TWEETS_EDIT, tweet);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModelWithBody(
          true, response.body["message"], response.body);
    } else {
      return ResponseModelWithBody(false, response.statusText, response.body);
    }
  }

  @override
  Future<ResponseModelWithBody> deleteTweet(int id) async {
    Response response = await apiSocial
        .deleteData(SocialEndpoint.UI_V1_TWEETS_ID + id.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModelWithBody(
          true, response.body["message"], response.body);
    } else {
      return ResponseModelWithBody(false, response.statusText, response.body);
    }
  }

  @override
  Future<List<Tweet>> searchTweets(String text, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_SEARCH_TEXT
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
  Future<Tweet> replyTweet(ReplyTweetRequest rep) async {
    try {
      Response response = await apiSocial.postData(
          SocialEndpoint.UI_V1_TWEETS_REPLY
              .replaceAll('{userId}', rep.userId.toString())
              .replaceAll('{tweetId}', rep.tweetId.toString()),
          rep);

      if (response.statusCode == 200) {
        if (response.body is List) {
          Tweet tweet = Tweet.fromJson(response.body);
          return tweet;
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
  Future<Tweet> quoteTweet(AddQuoteTweetRequest request) async {
    try {
      Response response = await apiSocial.postData(
          SocialEndpoint.UI_V1_TWEETS_QUOTE
              .replaceAll('{userId}', request.userId.toString())
              .replaceAll('{tweetId}', request.tweetId.toString()),
          request);

      if (response.statusCode == 200) {
        if (response.body is List) {
          Tweet tweet = Tweet.fromJson(response.body);
          return tweet;
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
  Future<Tweet> changeTweetReplyType(ChangeReplyTypeRequest request) async {
    try {
      Response response = await apiSocial.getData(
        SocialEndpoint.UI_V1_TWEETS_CHANGE_REPLY
            .replaceAll('{userId}', request.userId.toString())
            .replaceAll('{tweetId}', request.tweetId.toString())
            .replaceAll('{replyType}', request.replyType.toString()),
      );

      if (response.statusCode == 200) {
        if (response.body is List) {
          Tweet tweet = Tweet.fromJson(response.body);
          return tweet;
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
  Future<List<Image>> uploadMultiTweetImage(List<MultipartBody> images) async {
    try {
      Response response = await apiSocial.postMultipartData(
          SocialEndpoint.UI_V1_TWEETS_UPLOAD, {}, images, []);

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<Image> images =
              data.map((tweet) => Image.fromJson(tweet)).toList();
          print("Response JSON: ${jsonEncode(images)}");
          return images;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error uploading images: $e");
    }
  }

  @override
  Future<List<User>> getTaggedImageUsers(int tweetId, int page) async {
    try {
      Response response = await apiSocial.getData(SocialEndpoint
          .UI_V1_TWEETS_IMAGE_TAGGED
          .replaceAll('{tweetId}', tweetId.toString())
          .replaceAll('{page}', page.toString()));

      if (response.statusCode == 200) {
        if (response.body is List) {
          List<dynamic> data = response.body;
          List<User> users = data.map((tweet) => User.fromJson(tweet)).toList();
          return users;
        } else {
          throw Exception("Expected a list but received something else");
        }
      } else {
        throw Exception("Failed to load tweets");
      }
    } catch (e) {
      throw Exception("Error uploading images: $e");
    }
  }

  @override
  Future<ResponseModel> likeTweet(int id) async {
    Response response = await apiSocial.getData(SocialEndpoint
        .UI_V1_LIKE_TWEET_ID
        .replaceAll('{tweetId}', id.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseModel(true, response.body["message"]);
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
