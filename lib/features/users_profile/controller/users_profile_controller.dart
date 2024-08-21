import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../domain/service/users_profile_service_interface.dart';

class UsersProfileController extends GetxController implements GetxService {
  final UsersProfileServiceInterface userProfileServiceInterface;
  UsersProfileController({required this.userProfileServiceInterface}) {
    setCurrentUsers();
  }

  void setCurrentUsers() async {
    await userProfileServiceInterface.fetchCurrentUsers();
  }

  void getCurrentUsersLocal() async {
    final res =
        await userProfileServiceInterface.getCurrentUsersLocal();
    print(res.firstName);
    print("<<<<=====>>>>>");
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
