import 'dart:convert';

import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/repositories/dashboard_repo_interface.dart';
// import 'package:tomiru_social_flutter/features/product/controllers/campaign_controller.dart';
// import 'package:tomiru_social_flutter/features/cart/controllers/cart_controller.dart';
// import 'package:tomiru_social_flutter/features/cart/domain/repositories/cart_repository.dart';
// import 'package:tomiru_social_flutter/features/cart/domain/repositories/cart_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/cart/domain/services/cart_service.dart';
// import 'package:tomiru_social_flutter/features/cart/domain/services/cart_service_interface.dart';
import 'package:tomiru_social_flutter/features/chat/controllers/chat_controller.dart';
import 'package:tomiru_social_flutter/features/chat/domain/repositories/chat_repository.dart';
import 'package:tomiru_social_flutter/features/chat/domain/repositories/chat_repository_interface.dart';
import 'package:tomiru_social_flutter/features/chat/domain/services/chat_service.dart';
import 'package:tomiru_social_flutter/features/chat/domain/services/chat_service_interface.dart';
// import 'package:tomiru_social_flutter/features/checkout/controllers/checkout_controller.dart';
// import 'package:tomiru_social_flutter/features/checkout/domain/repositories/checkout_repository.dart';
// import 'package:tomiru_social_flutter/features/checkout/domain/repositories/checkout_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/checkout/domain/services/checkout_service.dart';
// import 'package:tomiru_social_flutter/features/checkout/domain/services/checkout_service_interface.dart';
// import 'package:tomiru_social_flutter/features/coupon/controllers/coupon_controller.dart';
// import 'package:tomiru_social_flutter/features/home/controllers/home_controller.dart';
// import 'package:tomiru_social_flutter/features/home/domain/repositories/home_repository.dart';
// import 'package:tomiru_social_flutter/features/home/domain/repositories/home_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/home/domain/services/home_service.dart';
// import 'package:tomiru_social_flutter/features/home/domain/services/home_service_interface.dart';
import 'package:tomiru_social_flutter/features/language/controllers/localization_controller.dart';
// import 'package:tomiru_social_flutter/features/order/controllers/order_controller.dart';
// import 'package:tomiru_social_flutter/features/order/domain/repositories/order_repository.dart';
// import 'package:tomiru_social_flutter/features/order/domain/repositories/order_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/order/domain/services/order_service.dart';
// import 'package:tomiru_social_flutter/features/order/domain/services/order_service_interface.dart';
// import 'package:tomiru_social_flutter/features/product/domain/repositories/campaign_repository.dart';
// import 'package:tomiru_social_flutter/features/product/domain/repositories/campaign_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/product/domain/services/campaign_service.dart';
// import 'package:tomiru_social_flutter/features/product/domain/services/campaign_service_interface.dart';
// import 'package:tomiru_social_flutter/features/restaurant/controllers/restaurant_controller.dart';
// import 'package:tomiru_social_flutter/features/html/controllers/html_controller.dart';
// import 'package:tomiru_social_flutter/features/html/domain/repositories/html_repository.dart';
// import 'package:tomiru_social_flutter/features/html/domain/repositories/html_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/html/domain/services/html_service.dart';
// import 'package:tomiru_social_flutter/features/html/domain/services/html_service_interface.dart';
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
// import 'package:tomiru_social_flutter/features/refer%20and%20earn/controllers/refer_and_earn_controller.dart';
// import 'package:tomiru_social_flutter/features/restaurant/domain/repositories/restaurant_repository.dart';
// import 'package:tomiru_social_flutter/features/restaurant/domain/repositories/restaurant_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/restaurant/domain/services/restaurant_service.dart';
// import 'package:tomiru_social_flutter/features/restaurant/domain/services/restaurant_service_interface.dart';
// import 'package:tomiru_social_flutter/features/search/controllers/search_controller.dart';
// import 'package:tomiru_social_flutter/features/search/domain/repositories/search_repository.dart';
// import 'package:tomiru_social_flutter/features/search/domain/repositories/search_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/search/domain/services/search_service.dart';
// import 'package:tomiru_social_flutter/features/search/domain/services/search_service_interface.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/splash_controller.dart';
import 'package:tomiru_social_flutter/features/splash/controllers/theme_controller.dart';
import 'package:tomiru_social_flutter/api/api_client.dart';
// import 'package:tomiru_social_flutter/features/address/controllers/address_controller.dart';
// import 'package:tomiru_social_flutter/features/address/domain/reposotories/address_repo.dart';
// import 'package:tomiru_social_flutter/features/address/domain/reposotories/address_repo_interface.dart';
// import 'package:tomiru_social_flutter/features/address/domain/services/address_service.dart';
// import 'package:tomiru_social_flutter/features/address/domain/services/address_service_interface.dart';
// import 'package:tomiru_social_flutter/features/auth/controllers/deliveryman_registration_controller.dart';
// import 'package:tomiru_social_flutter/features/auth/controllers/restaurant_registration_controller.dart';
import 'package:tomiru_social_flutter/features/auth/domain/reposotories/auth_repo.dart';
import 'package:tomiru_social_flutter/features/auth/domain/reposotories/auth_repo_interface.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/reposotories/deliveryman_registration_repo.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/reposotories/deliveryman_registration_repo_interface.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/reposotories/restaurant_registration_repo.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/reposotories/restaurant_registration_repo_interface.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service.dart';
import 'package:tomiru_social_flutter/features/auth/domain/services/auth_service_interface.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/services/deliveryman_registration_service.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/services/deliveryman_registration_service_interface.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/services/restaurant_registration_service.dart';
// import 'package:tomiru_social_flutter/features/auth/domain/services/restaurant_registration_service_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/repositories/business_repo_interface.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';
// import 'package:tomiru_social_flutter/features/category/controllers/category_controller.dart';
// import 'package:tomiru_social_flutter/features/category/domain/reposotories/category_repository.dart';
// import 'package:tomiru_social_flutter/features/category/domain/reposotories/category_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/category/domain/services/category_service.dart';
// import 'package:tomiru_social_flutter/features/category/domain/services/category_service_interface.dart';
// import 'package:tomiru_social_flutter/features/coupon/domain/reposotories/coupon_repository.dart';
// import 'package:tomiru_social_flutter/features/coupon/domain/reposotories/coupon_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/coupon/domain/services/coupon_service.dart';
// import 'package:tomiru_social_flutter/features/coupon/domain/services/coupon_service_interface.dart';
// import 'package:tomiru_social_flutter/features/cuisine/controllers/cuisine_controller.dart';
// import 'package:tomiru_social_flutter/features/cuisine/domain/repositories/cuisine_repository.dart';
// import 'package:tomiru_social_flutter/features/cuisine/domain/repositories/cuisine_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/cuisine/domain/services/cuisine_service.dart';
// import 'package:tomiru_social_flutter/features/cuisine/domain/services/cuisine_service_interface.dart';
import 'package:tomiru_social_flutter/features/dashboard/controllers/dashboard_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/services/dashboard_service.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/services/dashboard_service_interface.dart';
// import 'package:tomiru_social_flutter/features/favourite/controllers/favourite_controller.dart';
// import 'package:tomiru_social_flutter/features/favourite/domain/repositories/favourite_repository.dart';
// import 'package:tomiru_social_flutter/features/favourite/domain/repositories/favourite_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/favourite/domain/services/favourite_service.dart';
// import 'package:tomiru_social_flutter/features/favourite/domain/services/favourite_service_interface.dart';
// import 'package:tomiru_social_flutter/features/interest/controllers/interest_controller.dart';
// import 'package:tomiru_social_flutter/features/interest/domain/repositories/interest_repository.dart';
// import 'package:tomiru_social_flutter/features/interest/domain/repositories/interest_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/interest/domain/services/interest_service.dart';
// import 'package:tomiru_social_flutter/features/interest/domain/services/interest_service_interface.dart';
// import 'package:tomiru_social_flutter/features/location/controllers/location_controller.dart';
// import 'package:tomiru_social_flutter/features/location/domain/reposotories/location_repo.dart';
// import 'package:tomiru_social_flutter/features/location/domain/reposotories/location_repo_interface.dart';
// import 'package:tomiru_social_flutter/features/location/domain/services/location_service.dart';
// import 'package:tomiru_social_flutter/features/location/domain/services/location_service_interface.dart';
// import 'package:tomiru_social_flutter/features/loyalty/controllers/loyalty_controller.dart';
// import 'package:tomiru_social_flutter/features/loyalty/domain/repositories/loyalty_repository.dart';
// import 'package:tomiru_social_flutter/features/loyalty/domain/repositories/loyalty_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/loyalty/domain/services/loyalty_service.dart';
// import 'package:tomiru_social_flutter/features/loyalty/domain/services/loyalty_service_interface.dart';
// import 'package:tomiru_social_flutter/features/product/controllers/product_controller.dart';
// import 'package:tomiru_social_flutter/features/product/domain/repositories/product_repository.dart';
// import 'package:tomiru_social_flutter/features/product/domain/repositories/product_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/product/domain/services/product_service.dart';
// import 'package:tomiru_social_flutter/features/product/domain/services/product_service_interface.dart';
// import 'package:tomiru_social_flutter/features/review/controllers/review_controller.dart';
// import 'package:tomiru_social_flutter/features/review/domain/repositories/review_repository.dart';
// import 'package:tomiru_social_flutter/features/review/domain/repositories/review_repository_interface.dart';
// import 'package:tomiru_social_flutter/features/review/domain/services/review_service.dart';
// import 'package:tomiru_social_flutter/features/review/domain/services/review_service_interface.dart';
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

import '../features/user_wallet/controller/users_wallet_controller.dart';
import '../features/user_wallet/domain/repositories/users_wallet_repositories.dart';
import '../features/user_wallet/domain/repositories/users_wallet_repositories_interface.dart';
import '../features/user_wallet/domain/service/users_wallet_service.dart';
import '../features/user_wallet/domain/service/users_wallet_service_interface.dart';
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

  ///Interfaces
  // LocationRepoInterface locationRepoInterface =
  //     LocationRepo(apiClient: Get.find());
  // Get.lazyPut(() => locationRepoInterface);
  // LocationServiceInterface locationServiceInterface =
  //     LocationService(locationRepoInterface: Get.find());
  // Get.lazyPut(() => locationServiceInterface);
  // AddressRepoInterface addressRepoInterface =
  //     AddressRepo(apiClient: Get.find());
  // Get.lazyPut(() => addressRepoInterface);
  // AddressServiceInterface addressServiceInterface =
  //     AddressService(addressRepoInterface: Get.find());
  // Get.lazyPut(() => addressServiceInterface);
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
  AuthRepoInterface authRepoInterface =
      AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => authRepoInterface);
  AuthServiceInterface authServiceInterface =
      AuthService(authRepoInterface: Get.find());
  Get.lazyPut(() => authServiceInterface);
  // DeliverymanRegistrationRepoInterface deliverymanRegistrationRepoInterface =
  //     DeliverymanRegistrationRepo(apiClient: Get.find());
  // Get.lazyPut(() => deliverymanRegistrationRepoInterface);
  // DeliverymanRegistrationServiceInterface
  //     deliverymanRegistrationServiceInterface = DeliverymanRegistrationService(
  //         deliverymanRegistrationRepoInterface: Get.find());
  // Get.lazyPut(() => deliverymanRegistrationServiceInterface);
  // RestaurantRegistrationRepoInterface restaurantRegistrationRepoInterface =
  //     RestaurantRegistrationRepo(apiClient: Get.find());
  // Get.lazyPut(() => restaurantRegistrationRepoInterface);
  // RestaurantRegistrationServiceInterface
  //     restaurantRegistrationServiceInterface = RestaurantRegistrationService(
  //         restaurantRegistrationRepoInterface: Get.find());
  // Get.lazyPut(() => restaurantRegistrationServiceInterface);
  VerificationRepoInterface verificationRepoInterface =
      VerificationRepo(sharedPreferences: Get.find(), apiClient: Get.find());
  Get.lazyPut(() => verificationRepoInterface);
  VerificationServiceInterface verificationServiceInterface =
      VerificationService(
          verificationRepoInterface: Get.find(), authRepoInterface: Get.find());
  Get.lazyPut(() => verificationServiceInterface);
  // CategoryRepositoryInterface categoryRepositoryInterface =
  //     CategoryRepository(apiClient: Get.find());
  // Get.lazyPut(() => categoryRepositoryInterface);
  // CategoryServiceInterface categoryServiceInterface =
  //     CategoryService(categoryRepositoryInterface: Get.find());
  // Get.lazyPut(() => categoryServiceInterface);
  // CouponRepositoryInterface couponRepositoryInterface =
  //     CouponRepository(apiClient: Get.find());
  // Get.lazyPut(() => couponRepositoryInterface);
  // CouponServiceInterface couponServiceInterface =
  //     CouponService(couponRepositoryInterface: Get.find());
  // Get.lazyPut(() => couponServiceInterface);
  ChatRepositoryInterface chatRepositoryInterface =
      ChatRepository(apiClient: Get.find());
  Get.lazyPut(() => chatRepositoryInterface);
  ChatServiceInterface chatServiceInterface =
      ChatService(chatRepositoryInterface: Get.find());
  Get.lazyPut(() => chatServiceInterface);
  // CuisineRepositoryInterface cuisineRepositoryInterface =
  //     CuisineRepository(apiClient: Get.find());
  // Get.lazyPut(() => cuisineRepositoryInterface);
  // CuisineServiceInterface cuisineServiceInterface =
  //     CuisineService(cuisineRepositoryInterface: Get.find());
  // Get.lazyPut(() => cuisineServiceInterface);
  // FavouriteRepositoryInterface favouriteRepositoryInterface =
  //     FavouriteRepository(apiClient: Get.find());
  // Get.lazyPut(() => favouriteRepositoryInterface);
  // FavouriteServiceInterface favouriteServiceInterface =
  //     FavouriteService(favouriteRepositoryInterface: Get.find());
  // Get.lazyPut(() => favouriteServiceInterface);
  // ProductRepositoryInterface productRepositoryInterface =
  //     ProductRepository(apiClient: Get.find());
  // Get.lazyPut(() => productRepositoryInterface);
  // ProductServiceInterface productServiceInterface =
  //     ProductService(productRepositoryInterface: Get.find());
  // Get.lazyPut(() => productServiceInterface);
  // ReviewRepositoryInterface reviewRepositoryInterface =
  //     ReviewRepository(apiClient: Get.find());
  // Get.lazyPut(() => reviewRepositoryInterface);
  // ReviewServiceInterface reviewServiceInterface =
  //     ReviewService(reviewRepositoryInterface: Get.find());
  // Get.lazyPut(() => reviewServiceInterface);
  // InterestRepositoryInterface interestRepositoryInterface =
  //     InterestRepository(apiClient: Get.find());
  // Get.lazyPut(() => interestRepositoryInterface);
  // InterestServiceInterface interestServiceInterface =
  //     InterestService(interestRepositoryInterface: Get.find());
  // Get.lazyPut(() => interestServiceInterface);
  WalletRepositoryInterface walletRepositoryInterface =
      WalletRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => walletRepositoryInterface);
  WalletServiceInterface walletServiceInterface =
      WalletService(walletRepositoryInterface: Get.find());
  Get.lazyPut(() => walletServiceInterface);
  // LoyaltyRepositoryInterface loyaltyRepositoryInterface =
  //     LoyaltyRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  // Get.lazyPut(() => loyaltyRepositoryInterface);
  // LoyaltyServiceInterface loyaltyServiceInterface =
  //     LoyaltyService(loyaltyRepositoryInterface: Get.find());
  // Get.lazyPut(() => loyaltyServiceInterface);
  SplashRepositoryInterface splashRepositoryInterface =
      SplashRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  Get.lazyPut(() => splashRepositoryInterface);
  SplashServiceInterface splashServiceInterface =
      SplashService(splashRepositoryInterface: Get.find());
  Get.lazyPut(() => splashServiceInterface);
  // HtmlRepositoryInterface htmlRepositoryInterface =
  //     HtmlRepository(apiClient: Get.find());
  // Get.lazyPut(() => htmlRepositoryInterface);
  // HtmlServiceInterface htmlServiceInterface =
  //     HtmlService(htmlRepositoryInterface: Get.find());
  // Get.lazyPut(() => htmlServiceInterface);
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
  // SearchRepositoryInterface searchRepositoryInterface =
  //     SearchRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  // Get.lazyPut(() => searchRepositoryInterface);
  // SearchServiceInterface searchServiceInterface =
  //     SearchService(searchRepositoryInterface: Get.find());
  // Get.lazyPut(() => searchServiceInterface);
  ProfileRepositoryInterface profileRepositoryInterface =
      ProfileRepository(apiClient: Get.find());
  Get.lazyPut(() => profileRepositoryInterface);
  ProfileServiceInterface profileServiceInterface =
      ProfileService(profileRepositoryInterface: Get.find());
  Get.lazyPut(() => profileServiceInterface);
  // RestaurantRepositoryInterface restaurantRepositoryInterface =
  //     RestaurantRepository(
  //         apiClient: Get.find(), sharedPreferences: Get.find());
  // Get.lazyPut(() => restaurantRepositoryInterface);
  // RestaurantServiceInterface restaurantServiceInterface =
  //     RestaurantService(restaurantRepositoryInterface: Get.find());
  // Get.lazyPut(() => restaurantServiceInterface);
  // CheckoutRepositoryInterface checkoutRepositoryInterface =
  //     CheckoutRepository(apiClient: Get.find());
  // Get.lazyPut(() => checkoutRepositoryInterface);
  // CheckoutServiceInterface checkoutServiceInterface =
  //     CheckoutService(checkoutRepositoryInterface: Get.find());
  // Get.lazyPut(() => checkoutServiceInterface);
  // CartRepositoryInterface cartRepositoryInterface =
  //     CartRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  // Get.lazyPut(() => cartRepositoryInterface);
  // CartServiceInterface cartServiceInterface =
  //     CartService(cartRepositoryInterface: Get.find());
  // Get.lazyPut(() => cartServiceInterface);
  // OrderRepositoryInterface orderRepositoryInterface =
  //     OrderRepository(apiClient: Get.find());
  // Get.lazyPut(() => orderRepositoryInterface);
  // OrderServiceInterface orderServiceInterface =
  //     OrderService(orderRepositoryInterface: Get.find());
  // Get.lazyPut(() => orderServiceInterface);
  // HomeRepositoryInterface homeRepositoryInterface =
  //     HomeRepository(apiClient: Get.find());
  // Get.lazyPut(() => homeRepositoryInterface);
  // HomeServiceInterface homeServiceInterface =
  //     HomeService(homeRepositoryInterface: Get.find());
  // Get.lazyPut(() => homeServiceInterface);
  // CampaignRepositoryInterface campaignRepositoryInterface =
  //     CampaignRepository(apiClient: Get.find());
  // Get.lazyPut(() => campaignRepositoryInterface);
  // CampaignServiceInterface campaignServiceInterface =
  //     CampaignService(campaignRepositoryInterface: Get.find());
  // Get.lazyPut(() => campaignServiceInterface);

  UsersProfileRepositoryInterface usersProfileRepositoryInterface =
      UsersProfileRepository(
    apiClient: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => usersProfileRepositoryInterface);
  UsersProfileServiceInterface usersProfileServiceInterface =
      UsersProfileService(usersProfileRepositoryInterface: Get.find());
  Get.lazyPut(() => usersProfileServiceInterface);

  UsersWalletRepositoryInterface usersWalletRepositoryInterface =
      UsersWalletRepository(
    apiClient: Get.find(),
    sharedPreferences: Get.find(),
  );
  Get.lazyPut(() => usersWalletRepositoryInterface);
  UsersWalletServiceInterface usersWalletServiceInterface =
      UsersWalletService(usersWalletRepositoryInterface: Get.find());
  Get.lazyPut(() => usersWalletServiceInterface);

  /// Controller
  Get.lazyPut(() => ThemeController(splashServiceInterface: Get.find()));
  Get.lazyPut(() => SplashController(splashServiceInterface: Get.find()));
  Get.lazyPut(
      () => LocalizationController(languageServiceInterface: Get.find()));
  Get.lazyPut(() => OnBoardingController(onboardServiceInterface: Get.find()));
  Get.lazyPut(() => AuthController(authServiceInterface: Get.find()));
  // Get.lazyPut(() => AddressController(addressServiceInterface: Get.find()));
  // Get.lazyPut(() => LocationController(locationServiceInterface: Get.find()));
  Get.lazyPut(() => DashboardController(dashboardServiceInterface: Get.find()));
  // Get.lazyPut(() => DeliverymanRegistrationController(
  //     deliverymanRegistrationServiceInterface: Get.find()));
  // Get.lazyPut(() => RestaurantRegistrationController(
  //     restaurantRegistrationServiceInterface: Get.find()));
  Get.lazyPut(
      () => VerificationController(verificationServiceInterface: Get.find()));
  // Get.lazyPut(() => CategoryController(categoryServiceInterface: Get.find()));
  // Get.lazyPut(() => ChatController(chatServiceInterface: Get.find()));
  // Get.lazyPut(() => CuisineController(cuisineServiceInterface: Get.find()));
  // Get.lazyPut(() => FavouriteController(favouriteServiceInterface: Get.find()));
  // Get.lazyPut(() => ProductController(productServiceInterface: Get.find()));
  // Get.lazyPut(() => ReviewController(reviewServiceInterface: Get.find()));
  // Get.lazyPut(() => InterestController(interestServiceInterface: Get.find()));
  Get.lazyPut(() => WalletController(walletServiceInterface: Get.find()));
  // Get.lazyPut(() => LoyaltyController(loyaltyServiceInterface: Get.find()));
  // Get.lazyPut(() => HtmlController(htmlServiceInterface: Get.find()));
  Get.lazyPut(
      () => NotificationController(notificationServiceInterface: Get.find()));
  Get.lazyPut(() => ProfileController(profileServiceInterface: Get.find()));
  // Get.lazyPut(() => HomeController(homeServiceInterface: Get.find()));
  // Get.lazyPut(() => CartController(cartServiceInterface: Get.find()));
  // Get.lazyPut(
  //     () => RestaurantController(restaurantServiceInterface: Get.find()));
  // Get.lazyPut(() => ReferAndEarnController());
  // Get.lazyPut(() => SearchController(searchServiceInterface: Get.find()));
  // Get.lazyPut(() => CouponController(couponServiceInterface: Get.find()));
  // Get.lazyPut(() => OrderController(orderServiceInterface: Get.find()));
  // Get.lazyPut(() => CampaignController(campaignServiceInterface: Get.find()));
  // Get.lazyPut(() => CheckoutController(checkoutServiceInterface: Get.find()));
  Get.lazyPut(() => BusinessController(businessServiceInterface: Get.find()));
  Get.lazyPut(
      () => UsersProfileController(userProfileServiceInterface: Get.find()));
  Get.lazyPut(
      () => UsersWalletController(userWalletServiceInterface: Get.find()));

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
