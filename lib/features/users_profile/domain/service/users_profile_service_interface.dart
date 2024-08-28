import 'package:tomiru_social_flutter/features/splash/domain/models/config_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/master_data_models.dart';
import '../models/users_me.dart';

abstract class UsersProfileServiceInterface {

Future<UserProfile>fetchCurrentUsers();
Future<UserProfile>getCurrentUsersLocal();
Future<List<UserBalance>>getUsersBalancesLocal();


  Future<MasterDataModel> fetchMasterData();
  Future<MasterDataModel> getMasterDataLocal();
//
  Future<List<UserBalance>> getUsersBalances();
}
