import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/blocked_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/friend_use_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/muted_user_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_setting_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_token_model.dart';
import 'package:tomiru_social_flutter/interface/repository_interface.dart';

abstract class SocialUserRepositoryInterface extends RepositoryInterface {
  Future<UserTokenResponse> getUserByToken();
  Future<UserProfileResponse> getUserById(int userId);
  Future<List<User>> getUsers(int page);
  Future<List<User>> getRelevantUsers();
  Future<UserTokenResponse> updateUserProfile(EditUserRequest request);
  Future<UserTokenResponse> updateUserAbout(EditAboutRequest request);
  Future<UserDetailResponse> getUserDetails(int userId);
  Future<List<FriendUser>> fetchListFriend(int userId);
  Future<List<BlockedUser>> getBlockList(int page);
  Future<ResponseModel> processBlockList(int userId);
  Future<List<User>> getFollowers(int userId, int page);
  Future<List<User>> getFollowing(int userId, int page);
  Future<ResponseModel> processFollow(int userId);
  Future<List<MutedUser>> getMutedList(int page);
  Future<ResponseModel> processMutedList(int userId);
  Future<ResponseModel> processSubscribeToNotifications(int userId);
  Future<ResponseModel> updateUsername(UserSettingsRequest setting);
  Future<ResponseModel> updateEmail(UserSettingsRequest setting);
  Future<ResponseModel> updatePhone(UserSettingsRequest setting);
  Future<ResponseModel> updateCountry(UserSettingsRequest setting);
  Future<ResponseModel> updateGender(UserSettingsRequest setting);
  Future<ResponseModel> updateLanguage(UserSettingsRequest setting);
  Future<ResponseModel> updateDirectMessageRequests(
      UserSettingsRequest setting);
  Future<ResponseModel> updatePrivateProfile(UserSettingsRequest setting);
  Future<ResponseModel> updateColorScheme(UserSettingsRequest setting);
  Future<ResponseModel> updateBackgroundColor(UserSettingsRequest setting);
}
