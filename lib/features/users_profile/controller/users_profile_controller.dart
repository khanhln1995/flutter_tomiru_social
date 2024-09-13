import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart';

import '../domain/service/users_profile_service_interface.dart';

class UsersProfileController extends GetxController implements GetxService {
  final UsersProfileServiceInterface userProfileServiceInterface;
  UsersProfileController({required this.userProfileServiceInterface}) {
    setCurrentUsers();
    getCurrentUsersLocal();
  }
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  List<UserBalance> _userBalance = [];
  List<UserBalance>? get userBalance => _userBalance;

  void setCurrentUsers() async {
    await userProfileServiceInterface.fetchCurrentUsers();
    UserProfile res = await userProfileServiceInterface.getCurrentUsersLocal();
    _userProfile = res;
    update();
  }

  void getCurrentUsersLocal() async {
    UserProfile res = await userProfileServiceInterface.getCurrentUsersLocal();
    _userProfile = res;
    update();
  }

  void setMasterData() async {
    await userProfileServiceInterface.fetchMasterData();
  }

  void getMasterDataLocal() async {
    final masterData = await userProfileServiceInterface.getMasterDataLocal();
    // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    // print(masterData.packages);
    // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
  }

  void getUsersBalancesLocal() async {
    _userBalance = await userProfileServiceInterface.getUsersBalancesLocal();
    update();
  }
}
