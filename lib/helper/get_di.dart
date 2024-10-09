import 'dart:convert';
import 'package:tomiru_social_flutter/api/api_social.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/repositories/dashboard_repo_interface.dart';
import 'package:tomiru_social_flutter/features/chat/controllers/chat_controller.dart';
import 'package:tomiru_social_flutter/features/chat/domain/repositories/chat_repository.dart';
import 'package:tomiru_social_flutter/features/chat/domain/repositories/chat_repository_interface.dart';
import 'package:tomiru_social_flutter/features/chat/domain/services/chat_service.dart';
import 'package:tomiru_social_flutter/features/chat/domain/services/chat_service_interface.dart';
import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
import 'package:tomiru_social_flutter/features/language/domain/models/language_model.dart';
import 'package:tomiru_social_flutter/features/language/domain/repository/language_repository.dart';
import 'package:tomiru_social_flutter/features/language/domain/repository/language_repository_interface.dart';
import 'package:tomiru_social_flutter/features/language/domain/service/language_service.dart';
import 'package:tomiru_social_flutter/features/language/domain/service/language_service_interface.dart';
import 'package:tomiru_social_flutter/features/notification/controllers/notification_controller.dart';
import 'package:tomiru_social_flutter/features/notification/domain/repository/notification_repository.dart';
import 'package:tomiru_social_flutter/features/notification/domain/repository/notification_repository_interface.dart';
import 'package:tomiru_social_flutter/features/notification/domain/service/notification_service.dart';
import 'package:tomiru_social_flutter/features/notification/domain/service/notification_service_interface.dart';
import 'package:tomiru_social_flutter/features/onboard/controllers/onboard_controller.dart';
import 'package:tomiru_social_flutter/features/onboard/domain/repository/onboard_repository.dart';
import 'package:tomiru_social_flutter/features/onboard/domain/repository/onboard_repository_interface.dart';
import 'package:tomiru_social_flutter/features/onboard/domain/service/notification_service.dart';
import 'package:tomiru_social_flutter/features/onboard/domain/service/onboard_service_interface.dart';
import 'package:tomiru_social_flutter/features/profile/controllers/profile_controller.dart';
import 'package:tomiru_social_flutter/features/profile/domain/repositories/profile_repository.dart';
import 'package:tomiru_social_flutter/features/profile/domain/repositories/profile_repository_interface.dart';
import 'package:tomiru_social_flutter/features/profile/domain/services/profile_service.dart';
import 'package:tomiru_social_flutter/features/profile/domain/services/profile_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_group/controller/social_group_controller.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/repositories/social_group_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/repositories/social_group_repository.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/service/social_group_service.dart';
import 'package:tomiru_social_flutter/features/social_group/domain/service/social_group_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_search/controller/social_search_controller.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/repositories/social_search_repository.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/repositories/social_search_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/service/social_search_service.dart';
import 'package:tomiru_social_flutter/features/social_search/domain/service/social_search_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/controller/social_controller.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/repositories/social_repository.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/repositories/social_repository_interface.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/service/social_service.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/service/social_service_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/controller/social_user_controller.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/repositories/social_user_repositoriy_interface.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/repositories/social_user_repository.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/service/social_user_service.dart';
import 'package:tomiru_social_flutter/features/social_user/domain/service/social_user_service_interface.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/theme_controller.dart';
import 'package:tomiru_social_flutter/api/api_client.dart';
import 'package:tomiru_social_flutter/features/auth/domain/reposotories/auth_repo.dart';
import 'package:tomiru_social_flutter/features/auth/domain/reposotories/auth_repo_interface.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';
import 'package:tomiru_social_flutter/features/dashboard/controllers/dashboard_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/services/dashboard_service.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/services/dashboard_service_interface.dart';
import 'package:tomiru_social_flutter/features/splash/domain/repositories/splash_repository.dart';
import 'package:tomiru_social_flutter/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:tomiru_social_flutter/features/splash/domain/services/splash_service.dart';
import 'package:tomiru_social_flutter/features/splash/domain/services/splash_service_interface.dart';
import 'package:tomiru_social_flutter/features/users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/features/verification/controllers/verification_controller.dart';
import 'package:tomiru_social_flutter/features/verification/domain/reposotories/verification_repo.dart';
import 'package:tomiru_social_flutter/features/verification/domain/reposotories/verification_repo_interface.dart';
import 'package:tomiru_social_flutter/features/verification/domain/services/verification_service.dart';
import 'package:tomiru_social_flutter/features/verification/domain/services/verification_service_interface.dart';
import 'package:tomiru_social_flutter/features/wallet/controllers/wallet_controller.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/repositories/wallet_repository_interface.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/services/wallet_service.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/services/wallet_service_interface.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../features/users_profile/domain/repositories/users_profile_repositories.dart';
import '../features/users_profile/domain/repositories/users_profile_repositories_intrerface.dart';
import '../features/users_profile/domain/service/users_profile_service.dart';
import '../features/users_profile/domain/service/users_profile_service_interface.dart';

Future<Map<String, Map<String, String>>> init() async {
  /// Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => ApiSocial(
      appBaseUrl: AppConstants.socialUrl, sharedPreferences: Get.find()));

  ///Interfaces
  DashboardRepoInterface dashboardRepoInterface =
      DashboardRepo(sharedPreferences: Get.find());
  Get.lazyPut(() => dashboardRepoInterface);
  DashboardServiceInterface dashboardServiceInterface =
      DashboardService(dashboardRepoInterface: Get.find());
  Get.lazyPut(() => dashboardServiceInterface);
  BusinessRepoInterface businessRepoInterface =
      BusinessRepo(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => businessRepoInterface);
  BusinessServiceInterface businessServiceInterface =
      BusinessService(businessRepoInterface: Get.find());
  Get.lazyPut(() => businessServiceInterface);
  AuthRepoInterface authRepoInterface = AuthRepo(
      apiClient: Get.find(),
      apiSocial: Get.find(),
      sharedPreferences: Get.find());
  Get.lazyPut(() => authRepoInterface);
  AuthServiceInterface authServiceInterface =
      AuthService(authRepoInterface: Get.find());
  Get.lazyPut(() => authServiceInterface);
  VerificationRepoInterface verificationRepoInterface =
      VerificationRepo(sharedPreferences: Get.find(), apiClient: Get.find());
  Get.lazyPut(() => verificationRepoInterface);
  VerificationServiceInterface verificationServiceInterface =
      VerificationService(
          verificationRepoInterface: Get.find(), authRepoInterface: Get.find());
  Get.lazyPut(() => verificationServiceInterface);
  ChatRepositoryInterface chatRepositoryInterface =
      ChatRepository(apiClient: Get.find());
  Get.lazyPut(() => chatRepositoryInterface);
  ChatServiceInterface chatServiceInterface =
      ChatService(chatRepositoryInterface: Get.find());
  Get.lazyPut(() => chatServiceInterface);
  WalletRepositoryInterface walletRepositoryInterface =
      WalletRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => walletRepositoryInterface);
  WalletServiceInterface walletServiceInterface =
      WalletService(walletRepositoryInterface: Get.find());
  Get.lazyPut(() => walletServiceInterface);
  SplashRepositoryInterface splashRepositoryInterface =
      SplashRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => splashRepositoryInterface);
  SplashServiceInterface splashServiceInterface =
      SplashService(splashRepositoryInterface: Get.find());
  Get.lazyPut(() => splashServiceInterface);
  LanguageRepositoryInterface languageRepositoryInterface =
      LanguageRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => languageRepositoryInterface);
  LanguageServiceInterface languageServiceInterface =
      LanguageService(languageRepositoryInterface: Get.find());
  Get.lazyPut(() => languageServiceInterface);
  NotificationRepositoryInterface notificationRepositoryInterface =
      NotificationRepository(
          apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => notificationRepositoryInterface);
  NotificationServiceInterface notificationServiceInterface =
      NotificationService(notificationRepositoryInterface: Get.find());
  Get.lazyPut(() => notificationServiceInterface);
  OnboardRepositoryInterface onboardRepositoryInterface = OnboardRepository();
  Get.lazyPut(() => onboardRepositoryInterface);
  OnboardServiceInterface onboardServiceInterface =
      OnboardService(onboardRepositoryInterface: Get.find());
  Get.lazyPut(() => onboardServiceInterface);
  ProfileRepositoryInterface profileRepositoryInterface =
      ProfileRepository(apiClient: Get.find());
  Get.lazyPut(() => profileRepositoryInterface);
  ProfileServiceInterface profileServiceInterface =
      ProfileService(profileRepositoryInterface: Get.find());
  Get.lazyPut(() => profileServiceInterface);
  UsersProfileRepositoryInterface usersProfileRepositoryInterface =
      UsersProfileRepository(
    apiClient: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => usersProfileRepositoryInterface);
  UsersProfileServiceInterface usersProfileServiceInterface =
      UsersProfileService(usersProfileRepositoryInterface: Get.find());
  Get.lazyPut(() => usersProfileServiceInterface);

  WalletRepositoryInterface usersWalletRepositoryInterface = WalletRepository(
    apiClient: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => usersWalletRepositoryInterface);
  WalletServiceInterface usersWalletServiceInterface =
      WalletService(walletRepositoryInterface: Get.find());
  Get.lazyPut(() => usersWalletServiceInterface);

  SocialRepositoryInterface socialRepositoryInterface = SocialRepository(
    apiSocial: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => socialRepositoryInterface);
  SocialServiceInterface socialServiceInterface =
      SocialService(socialRepositoryInterface: Get.find());
  Get.lazyPut(() => socialServiceInterface);

  SocialSearchRepositoryInterface socialSearchRepositoryInterface =
      SocialSearchRepository(
    apiSocial: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => socialSearchRepositoryInterface);
  SocialSearchServiceInterface socialSearchServiceInterface =
      SocialSearchService(socialSearchRepositoryInterface: Get.find());
  Get.lazyPut(() => socialSearchServiceInterface);

  SocialUserRepositoryInterface socialUserRepositoryInterface =
      SocialUserRepository(
    apiSocial: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => socialUserRepositoryInterface);
  SocialUserServiceInterface socialUserServiceInterface =
      SocialUserService(socialUserRepositoryInterface: Get.find());
  Get.lazyPut(() => socialUserServiceInterface);

  SocialGroupRepositoryInterface socialGroupRepositoryInterface =
      SocialGroupRepository(
    apiSocial: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => socialGroupRepositoryInterface);
  SocialGroupServiceInterface socialGroupServiceInterface =
      SocialGroupService(socialGroupRepositoryInterface: Get.find());
  Get.lazyPut(() => socialGroupServiceInterface);

  /// Controller
  Get.lazyPut(() => ThemeController(splashServiceInterface: Get.find()));
  Get.lazyPut(() => SplashController(splashServiceInterface: Get.find()));
  Get.lazyPut(
      () => LocalizationController(languageServiceInterface: Get.find()));
  Get.lazyPut(() => OnBoardingController(onboardServiceInterface: Get.find()));
  Get.lazyPut(() => AuthController(authServiceInterface: Get.find()));
  Get.lazyPut(() => DashboardController(dashboardServiceInterface: Get.find()));

  Get.lazyPut(
      () => VerificationController(verificationServiceInterface: Get.find()));
  Get.lazyPut(() => WalletController(walletServiceInterface: Get.find()));
  Get.lazyPut(
      () => NotificationController(notificationServiceInterface: Get.find()));
  Get.lazyPut(() => ProfileController(
      profileServiceInterface: Get.find(), authServiceInterface: Get.find()));
  Get.lazyPut(
      () => UsersProfileController(userProfileServiceInterface: Get.find()));
  Get.lazyPut(() => WalletController(walletServiceInterface: Get.find()));
  Get.lazyPut(() => BusinessController(businessServiceInterface: Get.find()));
  Get.lazyPut(() => SocialController(socialServiceInterface: Get.find()));
  Get.lazyPut(
      () => SocialSearchController(socialSearchServiceInterface: Get.find()));
  Get.lazyPut(
      () => SocialUserController(socialUserServiceInterface: Get.find()));
  Get.lazyPut(
      () => SocialGroupController(socialGroupServiceInterface: Get.find()));

  /// Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }

  return languages;
}
