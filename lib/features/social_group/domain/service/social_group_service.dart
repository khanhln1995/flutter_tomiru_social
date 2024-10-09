import 'package:tomiru_social_flutter/common/models/response_model.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/models/group.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/repositories/social_group_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/service/social_group_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/models/user_model.dart';

class SocialGroupService implements SocialGroupServiceInterface {
  final SocialGroupRepositoryInterface socialGroupRepositoryInterface;
  SocialGroupService({required this.socialGroupRepositoryInterface});

  @override
  Future<GroupModel> createGroup(GroupModel request) async {
    return await socialGroupRepositoryInterface.createGroup(request);
  }

  @override
  Future<GroupModel> getGroupById(int id) async {
    return await socialGroupRepositoryInterface.getGroupById(id);
  }

  @override
  Future<GroupModel> editGroup(GroupModel request) async {
    return await socialGroupRepositoryInterface.editGroup(request);
  }

  @override
  Future<ResponseModel> deleteGroup(int id) async {
    return await socialGroupRepositoryInterface.deleteGroup(id);
  }

  @override
  Future<ResponseModel> requestJoinGroup(int id) async {
    return await socialGroupRepositoryInterface.requestJoinGroup(id);
  }

  @override
  Future<ResponseModel> acceptJoinGroup(
      AcceptUserToGroupRequest request) async {
    return await socialGroupRepositoryInterface.acceptJoinGroup(request);
  }

  @override
  Future<ResponseModel> removeMemberGroup(int groupId, int memberId) async {
    return await socialGroupRepositoryInterface.removeMemberGroup(
        groupId, memberId);
  }

  @override
  Future<ResponseModel> blockUserGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.blockUserGroup(groupId, userId);
  }

  @override
  Future<ResponseModel> unblockUserGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.unblockUserGroup(
        groupId, userId);
  }

  @override
  Future<ResponseModel> rejectGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.rejectGroup(groupId, userId);
  }

  @override
  Future<ResponseModel> assignGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.assignGroup(groupId, userId);
  }

  @override
  Future<ResponseModel> demotedGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.demotedGroup(groupId, userId);
  }

  @override
  Future<ResponseModel> transferRightsGroup(int groupId, int userId) async {
    return await socialGroupRepositoryInterface.transferRightsGroup(
        groupId, userId);
  }

  @override
  Future<List<GroupModel>> suggestGroup(int page) async {
    return await socialGroupRepositoryInterface.suggestGroup(page);
  }

  @override
  Future<List<GroupModel>> getGroupByUserId(int userId, int page) async {
    return await socialGroupRepositoryInterface.getGroupByUserId(userId, page);
  }

  @override
  Future<List<User>> getMemberGroup(int groupId, int page) async {
    return await socialGroupRepositoryInterface.getMemberGroup(groupId, page);
  }

  @override
  Future<List<User>> getPendingMemberGroup(int groupId, int page) async {
    return await socialGroupRepositoryInterface.getPendingMemberGroup(
        groupId, page);
  }

  @override
  Future<List<User>> getBlockedUserGroup(int groupId, int page) async {
    return await socialGroupRepositoryInterface.getBlockedUserGroup(
        groupId, page);
  }

  @override
  Future<List<GroupModel>> searchGroupByUserName(
      String groupName, int page) async {
    return await socialGroupRepositoryInterface.searchGroupByUserName(
        groupName, page);
  }
}
