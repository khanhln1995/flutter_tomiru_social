import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/edit_user_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_profile.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_setting_request.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/service/social_user_service_interface.dart';

class SocialUserController extends GetxController implements GetxService {
  final SocialUserServiceInterface socialUserServiceInterface;

  SocialUserController({required this.socialUserServiceInterface});

  void getUserByToken() async {
    await socialUserServiceInterface.getUserByToken();
  }

  void getUserById(int userId) async {
    await socialUserServiceInterface.getUserById(userId);
  }

  void getUsers(int userId) async {
    await socialUserServiceInterface.getUsers(userId);
  }

  void getRelevantUsers() async {
    await socialUserServiceInterface.getRelevantUsers();
  }

  void updateUserProfile(EditUserRequest request) async {
    await socialUserServiceInterface.updateUserProfile(request);
  }

  void updateUserAbout(EditAboutRequest request) async {
    await socialUserServiceInterface.updateUserAbout(request);
  }

  void getUserDetails(int userId) async {
    await socialUserServiceInterface.getUserDetails(userId);
  }

  void fetchListFriend(int userId) async {
    await socialUserServiceInterface.fetchListFriend(userId);
  }

  void getBlockList(int page) async {
    await socialUserServiceInterface.getBlockList(page);
  }

  void processBlockList(int userId) async {
    await socialUserServiceInterface.processBlockList(userId);
  }

  void getFollowers(int userId, int page) async {
    await socialUserServiceInterface.getFollowers(userId, page);
  }

  void getFollowing(int userId, int page) async {
    await socialUserServiceInterface.getFollowing(userId, page);
  }

  void processFollow(int userId) async {
    await socialUserServiceInterface.processFollow(userId);
  }

  void getMutedList(int page) async {
    await socialUserServiceInterface.getMutedList(page);
  }

  void processMutedList(int userId) async {
    await socialUserServiceInterface.getMutedList(userId);
  }

  void processSubscribeToNotifications(int userId) async {
    await socialUserServiceInterface.processSubscribeToNotifications(userId);
  }

  void updateUsername(UserSettingsRequest setting) async {
    await socialUserServiceInterface.updateUsername(setting);
  }
}
