import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/add_quote_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/reply_tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/service/social_service_interface.dart';

class SocialController extends GetxController implements GetxService {
  final SocialServiceInterface socialServiceInterface;

  SocialController({required this.socialServiceInterface});

  List<Tweet> _tweets = [];
  List<Tweet> get tweets => _tweets;

  List<Tweet> _reply = [];
  List<Tweet> get reply => _reply;

  late Tweet _tweet;
  Tweet get tweet => _tweet;

  Future<void> getTweets(int page) async {
    List<Tweet> tweets =
        await socialServiceInterface.getTweets(page.toString());
    _tweets.addAll(tweets);
    update();
  }

  void clearTweets() async {
    _tweets.clear();
  }

  void getTweetById(int id) async {
    Tweet _tweet = await socialServiceInterface.getTweetById(id);
  }

  void getTweetsByUser(int userId, int page) async {
    List<Tweet> tweets =
        await socialServiceInterface.getTweetsByUser(userId, page);
  }

  void getPinnedTweetByUserId(int id) async {
    Tweet tweet = await socialServiceInterface.getTweetById(id);
  }

  void getUserMediaTweets(int userId) async {
    List<Tweet> tweets =
        await socialServiceInterface.getUserMediaTweets(userId);
  }

  void getUserTweetImages(int userId) async {
    List<TweetImageResponse> tweets =
        await socialServiceInterface.getUserTweetImages(userId);
  }

  void getTweetAdditionalInfoById(int tweetId) async {
    TweetAdditionalInfoResponse tweets =
        await socialServiceInterface.getTweetAdditionalInfoById(tweetId);
  }

  void getRepliesByTweetId(int tweetId) async {
    List<Tweet> _reply =
        await socialServiceInterface.getRepliesByTweetId(tweetId);
  }

  void getQuotesByTweetId(int tweetId, int page) async {
    List<Tweet> tweets =
        await socialServiceInterface.getQuotesByTweetId(tweetId, page);
  }

  void getFollowersTweets(int page) async {
    List<Tweet> tweets = await socialServiceInterface.getFollowersTweets(page);
  }

  void createTweet(TweetRequest tweet) async {
    await socialServiceInterface.createTweet(tweet);
  }

  void editTweet(TweetRequest tweet) async {
    await socialServiceInterface.editTweet(tweet);
  }

  void deleteTweet(int id) async {
    await socialServiceInterface.deleteTweet(id);
  }

  void searchTweets(String text, int page) async {
    await socialServiceInterface.searchTweets(text, page);
  }

  void replyTweet(ReplyTweetRequest rep) async {
    await socialServiceInterface.replyTweet(rep);
  }

  void quoteTweet(AddQuoteTweetRequest request) async {
    await socialServiceInterface.quoteTweet(request);
  }

  void changeTweetReplyType(ChangeReplyTypeRequest request) async {
    await socialServiceInterface.changeTweetReplyType(request);
  }

  void uploadMultiTweetImage(List<MultipartBody> images) async {
    await socialServiceInterface.uploadMultiTweetImage(images);
  }

  void getTaggedImageUsers(int tweetId, int page) async {
    await socialServiceInterface.getTaggedImageUsers(tweetId, page);
  }

  void likeTweet(int id) async {
    await socialServiceInterface.likeTweet(id);
  }
}
