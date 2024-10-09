import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/models/group.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/service/social_group_service_interface.dart';

class SocialGroupController extends GetxController implements GetxService {
  final SocialGroupServiceInterface socialGroupServiceInterface;

  SocialGroupController({required this.socialGroupServiceInterface});

  void createGroup(GroupModel request) async {
    try {
      await socialGroupServiceInterface.createGroup(request);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void getGroupById(int id) async {
    try {
      await socialGroupServiceInterface.getGroupById(id);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void editGroup(GroupModel request) async {
    try {
      await socialGroupServiceInterface.editGroup(request);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void deleteGroup(int id) async {
    try {
      await socialGroupServiceInterface.deleteGroup(id);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void requestJoinGroup(int id) async {
    try {
      await socialGroupServiceInterface.deleteGroup(id);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void acceptJoinGroup(AcceptUserToGroupRequest request) async {
    try {
      await socialGroupServiceInterface.acceptJoinGroup(request);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void removeMemberGroup(int groupId, int memberId) async {
    try {
      await socialGroupServiceInterface.removeMemberGroup(groupId, memberId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void blockUserGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.blockUserGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void unblockUserGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.unblockUserGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void rejectGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.rejectGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void assignGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.assignGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void demotedGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.demotedGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void transferRightsGroup(int groupId, int userId) async {
    try {
      await socialGroupServiceInterface.demotedGroup(groupId, userId);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void suggestGroup(int page) async {
    try {
      await socialGroupServiceInterface.suggestGroup(page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void getGroupByUserId(int userId, int page) async {
    try {
      await socialGroupServiceInterface.getGroupByUserId(userId, page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void getMemberGroup(int groupId, int page) async {
    try {
      await socialGroupServiceInterface.getMemberGroup(groupId, page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void getPendingMemberGroup(int groupId, int page) async {
    try {
      await socialGroupServiceInterface.getPendingMemberGroup(groupId, page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void getBlockedUserGroup(int groupId, int page) async {
    try {
      await socialGroupServiceInterface.getBlockedUserGroup(groupId, page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }

  void searchGroupByUserName(String groupName, int page) async {
    try {
      await socialGroupServiceInterface.searchGroupByUserName(groupName, page);
    } catch (e) {
      showCustomSnackBar(
          e.toString().replaceAll('Exception', '').replaceAll(':', ''),
          showToaster: true);
    }
  }
}
