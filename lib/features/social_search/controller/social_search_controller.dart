import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/models/search_terms_request.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/service/social_search_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/service/social_service_interface.dart';

class SocialSearchController extends GetxController implements GetxService {
  final SocialSearchServiceInterface socialSearchServiceInterface;

  SocialSearchController({required this.socialSearchServiceInterface});

  void getUsersByUserName(String userName, int page) async {
    await socialSearchServiceInterface.getUsersByUserName(userName, page);
  }

  void getTweetsByTagName(String tag) async {
    await socialSearchServiceInterface.getTweetsByTagName(tag);
  }

  void getTweetsByText(String text, int page) async {
    await socialSearchServiceInterface.getTweetsByText(text, page);
  }

  void getRelevantUsers(SearchTermsRequest request) async {
    await socialSearchServiceInterface.getRelevantUsers(request);
  }
}
