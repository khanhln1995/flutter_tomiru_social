import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/models/group.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';

abstract class SocialGroupServiceInterface {
  Future<GroupModel> createGroup(GroupModel request);  Future<GroupModel> getGroupById(int id);
  Future<GroupModel> editGroup(GroupModel request);
  Future<ResponseModel> deleteGroup(int id);
  Future<ResponseModel> requestJoinGroup(int id);
  Future<ResponseModel> acceptJoinGroup(AcceptUserToGroupRequest request);
  Future<ResponseModel> removeMemberGroup(int groupId, int memberId);
  Future<ResponseModel> blockUserGroup(int groupId, int userId);
  Future<ResponseModel> unblockUserGroup(int groupId, int userId);
  Future<ResponseModel> rejectGroup(int groupId, int userId);
  Future<ResponseModel> assignGroup(int groupId, int userId);
  Future<ResponseModel> demotedGroup(int groupId, int userId);
  Future<ResponseModel> transferRightsGroup(int groupId, int userId);
  Future<List<GroupModel>> suggestGroup(int page);
  Future<List<GroupModel>> getGroupByUserId(int userId, int page);
  Future<List<User>> getMemberGroup(int groupId, int page);
  Future<List<User>> getPendingMemberGroup(int groupId, int page);
  Future<List<User>> getBlockedUserGroup(int groupId, int page);
  Future<List<GroupModel>> searchGroupByUserName(String groupName, int page);
}
