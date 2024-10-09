import 'package:tomiru_social_flutter/features/social_search/domain/models/search_terms_request.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/interface/repository_interface.dart';

abstract class SocialSearchRepositoryInterface extends RepositoryInterface {
  Future<List<User>> getUsersByUserName(String userName, int page);
  Future<List<Tweet>> getTweetsByTagName(String tag);
  Future<List<Tweet>> getTweetsByText(String text, int page);
  Future<CommonUser> getRelevantUsers(SearchTermsRequest request);
}
