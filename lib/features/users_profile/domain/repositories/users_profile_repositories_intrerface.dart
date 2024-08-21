import 'package:tomiru_social_flutter/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/master_data_models.dart';
import '../models/users_me.dart';

abstract class UsersProfileRepositoryInterface extends RepositoryInterface {


  Future<UserProfile>fetchCurrentUsers();
  Future<UserProfile>getCurrentUsersLocal();
  Future<List<UserBalance>>getUsersBalancesLocal();

  Future<MasterDataModel>fetchMasterData();
  Future<MasterDataModel>getMasterDataLocal();
}
