import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/change_reply_type_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/blocked_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/friend_use_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/muted_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_setting_request.dart';
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
  Future<List<User>> getUsers(int page) async {
    return await socialUserRepositoryInterface.getUsers(page);
  }

  @override
  Future<List<User>> getRelevantUsers() async {
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
  Future<List<FriendUser>> fetchListFriend(int userId) async {
    return await socialUserRepositoryInterface.fetchListFriend(userId);
  }

  @override
  Future<List<BlockedUser>> getBlockList(int page) async {
    return await socialUserRepositoryInterface.getBlockList(page);
  }

  @override
  Future<ResponseModel> processBlockList(int userId) async {
    return await socialUserRepositoryInterface.processBlockList(userId);
  }

  @override
  Future<List<User>> getFollowers(int userId, int page) async {
    return await socialUserRepositoryInterface.getFollowers(userId, page);
  }

  @override
  Future<List<User>> getFollowing(int userId, int page) async {
    return await socialUserRepositoryInterface.getFollowing(userId, page);
  }

  @override
  Future<ResponseModel> processFollow(int userId) async {
    return await socialUserRepositoryInterface.processFollow(userId);
  }

  @override
  Future<List<MutedUser>> getMutedList(int page) async {
    return await socialUserRepositoryInterface.getMutedList(page);
  }

  @override
  Future<ResponseModel> processMutedList(int userId) async {
    return await socialUserRepositoryInterface.processMutedList(userId);
  }

  @override
  Future<ResponseModel> processSubscribeToNotifications(int userId) async {
    return await socialUserRepositoryInterface
        .processSubscribeToNotifications(userId);
  }

  @override
  Future<ResponseModel> updateUsername(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateUsername(setting);
  }

  @override
  Future<ResponseModel> updateEmail(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateEmail(setting);
  }

  @override
  Future<ResponseModel> updatePhone(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updatePhone(setting);
  }

  @override
  Future<ResponseModel> updateCountry(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateCountry(setting);
  }

  @override
  Future<ResponseModel> updateGender(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateGender(setting);
  }

  @override
  Future<ResponseModel> updateLanguage(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateLanguage(setting);
  }

  @override
  Future<ResponseModel> updateDirectMessageRequests(
      UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface
        .updateDirectMessageRequests(setting);
  }

  @override
  Future<ResponseModel> updatePrivateProfile(
      UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updatePrivateProfile(setting);
  }

  @override
  Future<ResponseModel> updateColorScheme(UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateColorScheme(setting);
  }

  @override
  Future<ResponseModel> updateBackgroundColor(
      UserSettingsRequest setting) async {
    return await socialUserRepositoryInterface.updateBackgroundColor(setting);
  }
}
