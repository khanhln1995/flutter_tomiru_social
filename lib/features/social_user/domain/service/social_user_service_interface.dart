import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/friend_use_response.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_token_model.dart';

abstract class SocialUserServiceInterface {
  Future<UserTokenResponse> getUserByToken();
  Future<UserProfileResponse> getUserById(int userId);
  Future<List<UserResponse>> getUsers(int page);
  Future<List<UserResponse>> getRelevantUsers();
  Future<UserTokenResponse> updateUserProfile(EditUserRequest request);
  Future<UserTokenResponse> updateUserAbout(EditAboutRequest request);
  Future<UserDetailResponse> getUserDetails(int userId);
  Future<List<FriendUserResponse>> fetchListFriend(int userId);
}
