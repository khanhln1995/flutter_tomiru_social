import 'package:tomiru_social_flutter/features/social_search/domain/models/search_terms_request.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/repositories/social_search_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/service/social_search_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';

class SocialSearchService implements SocialSearchServiceInterface {
  final SocialSearchRepositoryInterface socialSearchRepositoryInterface;
  SocialSearchService({required this.socialSearchRepositoryInterface});

  @override
  Future<List<User>> getUsersByUserName(String userName, int page) async {
    return await socialSearchRepositoryInterface.getUsersByUserName(
        userName, page);
  }

  @override
  Future<List<Tweet>> getTweetsByTagName(String tag) async {
    return await socialSearchRepositoryInterface.getTweetsByTagName(tag);
  }

  @override
  Future<List<Tweet>> getTweetsByText(String text, int page) async {
    return await socialSearchRepositoryInterface.getTweetsByText(text, page);
  }

  @override
  Future<CommonUser> getRelevantUsers(SearchTermsRequest request) async {
    return await socialSearchRepositoryInterface.getRelevantUsers(request);
  }
}
