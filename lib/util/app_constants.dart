import 'package:tomiru_social_flutter/features/language/domain/models/language_model.dart';
import 'package:tomiru_social_flutter/util/images.dart';
// import 'package:get/get.dart';

class AppConstants {
  static const String appName = 'Tomiru Social';
  static const double appVersion = 7.5;

  static const String fontFamily = 'Roboto';
  static const bool payInWevView = false;

  // static const String baseUrl = 'http://192.168.102.56:3003';
  static const String baseUrl = 'http://192.168.102.47:8000';
  static const String socialUrl = 'http://192.168.102.47:8000';

  // sentTOken

// AUTH
  // static const String loginUri = '/ui/v1/auth/login';
  static const String loginUri = '/api/v1.0/auth/login';
  static const String logoutUri = '/api/v1.0/auth/logout';
  // static const String registerUri = '/api/register';
  static const String registerUri = '/api/v1.0/auth/register';
  static const String socialLoginUri = '/api/v1/auth/social-login';
  static const String socialRegisterUri = '/api/v1/auth/social-register';

  static const String tokenUri = '/api/v1/customer/cm-firebase-token';
  static const String verifyTokenUri = '/api/v1.0/auth/verify-token';
  static const String forgetPasswordUri = '/api/v1.0/auth/forgot-otp';
  static const String resetPasswordUri = '/api/v1/auth/reset-password';

  static const String checkEmailUri = '/api/v1/auth/check-email';
  static const String verifyEmailUri = '/api/v1/auth/verify-email';
  static const String verifyPhoneUri = '/api/v1/auth/verify-phone';
  static const String forgotConfirmOtpUri = '/api/v1.0/auth/forgot-confirm-otp';
  static const String sigupConfirmOtpUri =
      '/api/v1.0/auth/register-confirm-otp';
  // USER
  static const String updateProfileUri = '/api/v1/customer/update-profile';
  static const String customerRemoveUri = '/api/v1/customer/remove-account';
  static const String customerInfoUri = '/ui/v1/user/details/2';
  static const String configUri = '/api/v1/config';

// CHAT
  static const String conversationListUri = '/api/v1/customer/message/list';
  static const String searchConversationListUri =
      '/api/v1/customer/message/search-list';
  static const String messageListUri = '/api/v1/customer/message/details';
  static const String sendMessageUri = '/api/v1/customer/message/send';

  static const String subscriptionUri = '/api/v1/newsletter/subscribe';

  static const String notificationUri = '/api/v1/customer/notifications';
  static const String walletTransactionUri =
      '/api/v1/customer/wallet/transactions';

  static const String addFundUri = '/api/v1/customer/wallet/add-fund';
  static const String walletBonusUri = '/api/v1/customer/wallet/bonuses';

  // key sharedPreferences
  static const String jwtToken = 'accessToken';
  static const String jwtTokenShop = 'accessTokenShop';
  static const String jwtTokenSocial = 'accessTokenSocial';
  //save response api me
  static const String userProfile = 'user_profile';
  static const String masterData = 'master_data';
  static const String walletHistory = 'wallet_history';
  static const String usersBalances = 'users_balances';
  static const String emailListKey = 'email_List';

  static const String theme = 'theme';
  static const String token = 'multivendor_token';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cacheCountryCode = 'cache_country_code';
  static const String cacheLanguageCode = 'cache_language_code';
  static const String cartList = 'cart_list';
  static const String userPosition = 'user_position';
  static const String userSelfInfo = 'user_self_info';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String userEmail = 'user_email';
  static const String userCountryCode = 'user_country_code';
  static const String notification = 'notification';
  static const String searchHistory = 'search_history';
  static const String intro = 'intro';
  static const String notificationCount = 'notification_count';
  static const String notificationIdList = 'notification_id_list';
  static const String topic = 'all_zone_customer';
  static const String zoneId = 'zoneId';
  static const String localizationKey = 'X-localization';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String earnPoint = 'stackfood_earn_point';
  static const String acceptCookies = '6ammart_accept_cookies';
  static const String cookiesManagement = 'cookies_management';
  static const String dmTipIndex = 'stackfood_dm_tip_index';
  static const String walletAccessToken = '6ammart_wallet_access_token';
  static const String guestId = 'stackfood_guest_id';
  static const String guestNumber = 'stackfood_guest_number';
  static const String dmRegisterSuccess = 'stackfood_dm_registration_success';
  static const String isRestaurantRegister =
      'stackfood_restaurant_registration';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.vietnam,
        languageName: 'vietnamese',
        countryCode: 'VN',
        languageCode: 'vn'),
    LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];

  static final List<Map<String, String>> walletTransactionSortingList = [
    {'title': 'all_transactions', 'value': 'all'},
    {'title': 'order_transactions', 'value': 'order'},
    {'title': 'converted_from_loyalty_point', 'value': 'loyalty_point'},
    {'title': 'added_via_payment_method', 'value': 'add_fund'},
    {'title': 'earned_by_referral', 'value': 'referrer'},
  ];

  // WALLET
  static const String apiV1 = '/api/v1.0';
  static const String apiV1Users = '$apiV1/users';
  static const String apiV1MasterData = '$apiV1/master-data';
  static const String apiV1UsersMe = '$apiV1Users/me';
  static const String apiV1UsersWalletHistory = '$apiV1Users/wallet-history';
  static const String apiV1UsersIncomeHistory = '$apiV1Users/income-history';
  static const String apiV1UsersSendCoin = '$apiV1Users/send-token';
  static const String requestOTPUri = '$apiV1Users/send-token-otp';
  static const String apiV1UsersCheckIn = '$apiV1Users/checkIn';
  static const String apiV1AgencyList = '$apiV1/agency/list';

  // BUSINESS
  static const String apiV1UsersPackages = '$apiV1Users/packages';
  static const String apiV1UsersBuyPackages = '$apiV1Users/buy-packages';
  static const String apiV1TernaryTree = '$apiV1/ternary-tree/my-list';
  static const String apiV1TernaryTreeUsername = '$apiV1/ternary-tree/list';
  // static const String apiV1TernaryTreeUsername =
  //     '$apiV1/ternary-tree/list?filters[username]=';
  static const String apiV1VaultInfo = '$apiV1/vault/info';

  static const String weatherApiKey = 'c7d314a6b3bffaca06d052ca17cd807e';
}
