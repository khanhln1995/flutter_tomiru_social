import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/friend_use_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_token_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/repositories/social_user_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/service/social_user_service_interface.dart';

class SocialUserService implements SocialUserServiceInterface {
  final SocialUserRepositoryInterface socialUserRepositoryInterface;
  SocialUserService({required this.socialUserRepositoryInterface});

  @override
  Future<UserTokenResponse> getUserByToken() async {
    return await socialUserRepositoryInterface.getUserByToken();
  }

  @override
  Future<UserProfileResponse> getUserById(int userId) async {
    return await socialUserRepositoryInterface.getUserById(userId);
  }

  @override
  Future<List<UserResponse>> getUsers(int page) async {
    return await socialUserRepositoryInterface.getUsers(page);
  }

  @override
  Future<List<UserResponse>> getRelevantUsers() async {
    return await socialUserRepositoryInterface.getRelevantUsers();
  }

  @override
  Future<UserTokenResponse> updateUserProfile(EditUserRequest request) async {
    return await socialUserRepositoryInterface.updateUserProfile(request);
  }

  @override
  Future<UserTokenResponse> updateUserAbout(EditAboutRequest request) async {
    return await socialUserRepositoryInterface.updateUserAbout(request);
  }

  @override
  Future<UserDetailResponse> getUserDetails(int userId) async {
    return await socialUserRepositoryInterface.getUserDetails(userId);
  }

  @override
  Future<List<FriendUserResponse>> fetchListFriend(int userId) async {
    return await socialUserRepositoryInterface.fetchListFriend(userId);
  }
}
