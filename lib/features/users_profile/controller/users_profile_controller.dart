import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart';

import '../domain/service/users_profile_service_interface.dart';

class UsersProfileController extends GetxController implements GetxService {
  final UsersProfileServiceInterface userProfileServiceInterface;
  UsersProfileController({required this.userProfileServiceInterface}) {
    setCurrentUsers();
  }
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;
  void setCurrentUsers() async {
    await userProfileServiceInterface.fetchCurrentUsers();
  }

  void getCurrentUsersLocal() async {
    UserProfile res = await userProfileServiceInterface.getCurrentUsersLocal();
    print(res);
    print("===========");
    _userProfile = res;
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
    final usersBalances =
        await userProfileServiceInterface.getUsersBalancesLocal();

    // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    // print(usersBalances);
    // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
  }
}
