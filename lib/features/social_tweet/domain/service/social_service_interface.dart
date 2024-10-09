import 'package:get/get_connect/http/src/response/response.dart';
import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/add_quote_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/reply_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';

abstract class SocialServiceInterface {
  Future<List<Tweet>> getTweets(String page);
  Future<Tweet> getTweetById(int id);
  Future<List<Tweet>> getTweetsByUser(int userId, int page);

  Future<Tweet> getPinnedTweetByUserId(int id);
  Future<List<Tweet>> getUserMediaTweets(int id);
  Future<List<TweetImageResponse>> getUserTweetImages(int userId);
  Future<TweetAdditionalInfoResponse> getTweetAdditionalInfoById(int tweetId);
  Future<List<Tweet>> getRepliesByTweetId(int tweetId);
  Future<List<Tweet>> getQuotesByTweetId(int tweetId, int page);
  Future<List<Tweet>> getFollowersTweets(int page);
  Future<ResponseModelWithBody> createTweet(TweetRequest tweet);
  Future<ResponseModelWithBody> editTweet(TweetRequest tweet);
  Future<ResponseModelWithBody> deleteTweet(int id);
  Future<List<Tweet>> searchTweets(String text, int page);
  Future<Tweet> replyTweet(ReplyTweetRequest rep);
  Future<Tweet> quoteTweet(AddQuoteTweetRequest request);
  Future<Tweet> changeTweetReplyType(ChangeReplyTypeRequest request);
  Future<List<Image>> uploadMultiTweetImage(List<MultipartBody> images);
  Future<List<User>> getTaggedImageUsers(int tweetId, int page);
  Future<ResponseModel> likeTweet(int id);
}
