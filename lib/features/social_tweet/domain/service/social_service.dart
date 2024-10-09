import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/add_quote_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/reply_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/repositories/social_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/service/social_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';

class SocialService implements SocialServiceInterface {
  final SocialRepositoryInterface socialRepositoryInterface;
  SocialService({required this.socialRepositoryInterface});

  @override
  Future<List<Tweet>> getTweets(String page) async {
    return await socialRepositoryInterface.getTweets(page);
  }

  @override
  Future<Tweet> getTweetById(int id) async {
    return await socialRepositoryInterface.getTweetById(id);
  }

  @override
  Future<List<Tweet>> getTweetsByUser(int userId, int page) async {
    return await socialRepositoryInterface.getTweetsByUser(userId, page);
  }

  @override
  Future<Tweet> getPinnedTweetByUserId(int id) async {
    return await socialRepositoryInterface.getTweetById(id);
  }

  @override
  Future<List<Tweet>> getUserMediaTweets(int userId) async {
    return await socialRepositoryInterface.getUserMediaTweets(userId);
  }

  @override
  Future<List<TweetImageResponse>> getUserTweetImages(int userId) async {
    return await socialRepositoryInterface.getUserTweetImages(userId);
  }

  @override
  Future<TweetAdditionalInfoResponse> getTweetAdditionalInfoById(
      int tweetId) async {
    return await socialRepositoryInterface.getTweetAdditionalInfoById(tweetId);
  }

  @override
  Future<List<Tweet>> getRepliesByTweetId(int tweetId) async {
    return await socialRepositoryInterface.getRepliesByTweetId(tweetId);
  }

  @override
  Future<List<Tweet>> getQuotesByTweetId(int tweetId, int page) async {
    return await socialRepositoryInterface.getQuotesByTweetId(tweetId, page);
  }

  @override
  Future<List<Tweet>> getFollowersTweets(int page) async {
    return await socialRepositoryInterface.getFollowersTweets(page);
  }

  @override
  Future<ResponseModelWithBody> createTweet(TweetRequest tweet) async {
    return await socialRepositoryInterface.createTweet(tweet);
  }

  @override
  Future<ResponseModelWithBody> editTweet(TweetRequest tweet) async {
    return await socialRepositoryInterface.createTweet(tweet);
  }

  @override
  Future<ResponseModelWithBody> deleteTweet(int id) async {
    return await socialRepositoryInterface.deleteTweet(id);
  }

  @override
  Future<List<Tweet>> searchTweets(String text, int page) async {
    return await socialRepositoryInterface.searchTweets(text, page);
  }

  @override
  Future<Tweet> replyTweet(ReplyTweetRequest rep) async {
    return await socialRepositoryInterface.replyTweet(rep);
  }

  @override
  Future<Tweet> quoteTweet(AddQuoteTweetRequest request) async {
    return await socialRepositoryInterface.quoteTweet(request);
  }

  @override
  Future<Tweet> changeTweetReplyType(ChangeReplyTypeRequest request) async {
    return await socialRepositoryInterface.changeTweetReplyType(request);
  }

  @override
  Future<List<Image>> uploadMultiTweetImage(List<MultipartBody> images) async {
    return await socialRepositoryInterface.uploadMultiTweetImage(images);
  }

  @override
  Future<List<User>> getTaggedImageUsers(int tweetId, int page) async {
    return await socialRepositoryInterface.getTaggedImageUsers(tweetId, page);
  }

  @override
  Future<ResponseModel> likeTweet(int id) async {
    return await socialRepositoryInterface.likeTweet(id);
  }
}
