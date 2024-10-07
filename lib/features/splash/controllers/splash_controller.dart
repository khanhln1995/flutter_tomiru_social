import 'package:tomiru_social_flutter/common/widgets_2/custom_loader_widget.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/splash/domain/models/config_model.dart';
import 'package:tomiru_social_flutter/features/splash/domain/services/splash_service_interface.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController implements GetxService {
  final SplashServiceInterface splashServiceInterface;

  SplashController({required this.splashServiceInterface});

  final ConfigModel _configModel = ConfigModel(
      businessName: "Gourmet Bistro",
      logo: "https://example.com/logo.png",
      address: "123 Culinary Street, Food City, FC 12345",
      phone: "+1-234-567-890",
      email: "info@gourmetbistro.com",
      // baseUrls: BaseUrls(),
      currencySymbol: "\$",
      cashOnDelivery: true,
      digitalPayment: true,
      termsAndConditions: "https://gourmetbistro.com/terms",
      privacyPolicy: "https://gourmetbistro.com/privacy",
      aboutUs: "Gourmet Bistro is a premium food delivery service.",
      country: "Foodland",
      // defaultLocation:
      //     DefaultLocation(latitude: 40.712776, longitude: -74.005974),
      appUrlAndroid:
          "https://play.google.com/store/apps/details?id=com.gourmetbistro",
      appUrlIos: "https://apps.apple.com/app/id1234567890",
      customerVerification: true,
      orderDeliveryVerification: true,
      currencySymbolDirection: "left",
      appMinimumVersionAndroid: 1.2,
      appMinimumVersionIos: 1.3,
      freeDeliveryOver: 50.0,
      demo: false,
      maintenanceMode: false,
      popularFood: 10,
      popularRestaurant: 5,
      mostReviewedFoods: 15,
      newRestaurant: 8,
      orderConfirmationModel: "instant",
      showDmEarning: true,
      canceledByDeliveryman: true,
      canceledByRestaurant: false,
      timeformat: "24h",
      toggleVegNonVeg: true,
      toggleDmRegistration: false,
      toggleRestaurantRegistration: false,
      socialLogin: [
        SocialLogin(
          loginMedium: "",
          status: true,
          clientId: "",
        ),
        SocialLogin(
          loginMedium: "",
          status: true,
          clientId: "",
        ),
      ],
      appleLogin: [
        SocialLogin(
          loginMedium: "",
          status: false,
          clientId: "",
        )
      ],
      scheduleOrderSlotDuration: 30,
      digitAfterDecimalPoint: 2,
      loyaltyPointExchangeRate: 100,
      loyaltyPointItemPurchasePoint: 1.0,
      loyaltyPointStatus: 1,
      minimumPointToTransfer: 50,
      customerWalletStatus: 1,
      dmTipsStatus: 1,
      refEarningStatus: 1,
      refEarningExchangeRate: 10.0,
      theme: 1,
      // businessPlan: BusinessPlan(planName: "Premium", planPrice: 99.99),
      // adminCommission: 15.0,
      // refundStatus: true,
      // refundPolicyStatus: 1,
      // refundPolicyData: "Refunds are processed within 5-7 business days.",
      // cancellationPolicyStatus: 1,
      // cancellationPolicyData:
      //     "Cancellations are allowed within 1 hour of order placement.",
      // shippingPolicyStatus: 1,
      // shippingPolicyData: "Free shipping on orders over \$50.",
      // freeTrialPeriodStatus: 1,
      // freeTrialPeriodDay: 30,
      // taxIncluded: 1,
      // cookiesText: "We use cookies to improve your experience.",
      // // language: [Language(name: "English", code: "en")],
      // takeAway: true,
      // homeDelivery: true,
      // repeatOrderOption: true,
      // socialMedia: [
      //   SocialMedia(
      //       platform: "Facebook", url: "https://facebook.com/gourmetbistro")
      // ],
      footerText: "© 2024 Gourmet Bistro. All rights reserved.",
      // landingPageLinks: LandingPageLinks(
      //     aboutUs: "https://gourmetbistro.com/about",
      //     contactUs: "https://gourmetbistro.com/contact"),
      // activePaymentMethodList: [
      //   PaymentBody(methodName: "Credit Card", status: true)
      // ],
      // digitalPaymentInfo:
      //     DigitalPaymentInfo(provider: "Stripe", apiKey: "stripe-api-key"),
      // addFundStatus: true,
      // partialPaymentStatus: true,
      // partialPaymentMethod: "Wallet",
      // additionalChargeStatus: true,
      // additionalChargeName: "Service Fee",
      // additionCharge: 1.99,
      // bannerData: BannerData(
      //     bannerUrl: "https://example.com/banner.png",
      //     bannerLink: "https://gourmetbistro.com/promo"),
      // offlinePaymentStatus: false,
      // freeDeliveryDistanceStatus: true,
      // freeDeliveryDistance: 10.0,
      // instantOrder: true,
      // customerDateOrderStatus: true,
      // customerOrderDate: 20240101,
      // restaurantAdditionalJoinUsPageData: RestaurantAdditionalJoinUsPageData(
      //     description: "Join our network of premium restaurants."),
      // deliverymanAdditionalJoinUsPageData: DeliverymanAdditionalJoinUsPageData(
      //     description: "Join us as a delivery partner and earn."),
      guestCheckoutStatus: true,
      favIcon: "https://example.com/favicon.ico");
  ConfigModel? get configModel => _configModel;

  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  bool _hasConnection = true;
  bool get hasConnection => _hasConnection;

  bool _savedCookiesData = false;
  bool get savedCookiesData => _savedCookiesData;

  String? _htmlText;
  String? get htmlText => _htmlText;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DateTime get currentTime => DateTime.now();

  Future<bool> getConfigData() async {
    // _hasConnection = true;
    // _savedCookiesData = getCookiesData();
    // Response response = await splashServiceInterface.getConfigData();
    // bool isSuccess = false;
    // // _configModel = splashServiceInterface.prepareConfigData(response);

    // isSuccess = configModel != null;
    bool isSuccess = true;
    // update();

    return isSuccess;
  }

  Future<bool> initSharedData() {
    return splashServiceInterface.initSharedData();
  }

  bool? showIntro() {
    return splashServiceInterface.showIntro();
  }

  void disableIntro() {
    splashServiceInterface.disableIntro();
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  void saveCookiesData(bool data) {
    splashServiceInterface.saveCookiesData(data);
    _savedCookiesData = true;
    update();
  }

  bool getCookiesData() {
    return splashServiceInterface.getCookiesData();
  }

  void cookiesStatusChange(String? data) {
    splashServiceInterface.cookiesStatusChange(data);
  }

  bool getAcceptCookiesStatus(String data) {
    return splashServiceInterface.getAcceptCookiesStatus(data);
  }

  Future<bool> subscribeMail(String email) async {
    _isLoading = true;
    update();
    bool isSuccess = await splashServiceInterface.subscribeMail(email);
    _isLoading = false;
    update();
    return isSuccess;
  }

  Future<void> navigateToLocationScreen(String page,
      {bool offNamed = false, bool offAll = false}) async {
    if (offNamed) {
      Get.offNamed(RouteHelper.getAccessLocationRoute(page));
    } else if (offAll) {
      Get.offAllNamed(RouteHelper.getAccessLocationRoute(page));
    } else {
      Get.toNamed(RouteHelper.getAccessLocationRoute(page));
    }
  }
}
