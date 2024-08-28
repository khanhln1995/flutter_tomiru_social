import 'package:tomiru_social_flutter/features/users_profile/domain/service/users_profile_service_interface.dart';

import '../models/master_data_models.dart';
import '../models/users_me.dart';
import '../repositories/users_profile_repositories_intrerface.dart';

class UsersProfileService implements UsersProfileServiceInterface {
  final UsersProfileRepositoryInterface usersProfileRepositoryInterface;
  UsersProfileService({required this.usersProfileRepositoryInterface});


  @override
  Future<UserProfile>fetchCurrentUsers()async {
   return await usersProfileRepositoryInterface.fetchCurrentUsers();

  }

  @override
  Future<UserProfile> getCurrentUsersLocal() async {
    return await usersProfileRepositoryInterface.getCurrentUsersLocal();
  }

  @override
  Future<MasterDataModel> fetchMasterData() async {
    return await usersProfileRepositoryInterface.fetchMasterData();
  }

  @override
  Future<MasterDataModel> getMasterDataLocal() async {
    return await usersProfileRepositoryInterface.getMasterDataLocal();
  }

  @override
  Future<List<UserBalance>> getUsersBalancesLocal() async {
    return await usersProfileRepositoryInterface.getUsersBalancesLocal();
  }

  @override
  Future<List<UserBalance>> getUsersBalances() {
    return usersProfileRepositoryInterface.getUsersBalances();
  }
}
