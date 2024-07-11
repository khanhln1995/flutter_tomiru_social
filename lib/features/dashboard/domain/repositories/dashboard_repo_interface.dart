import 'package:tomiru_social_flutter/interface/repository_interface.dart';

abstract class DashboardRepoInterface implements RepositoryInterface {
  Future<bool> saveRegistrationSuccessful(bool status);
  Future<bool> saveIsRestaurantRegistration(bool status);
  bool getRegistrationSuccessful();
  bool getIsRestaurantRegistration();
}
