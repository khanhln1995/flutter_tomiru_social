// import 'package:tomiru_social_flutter/features/address/domain/models/address_model.dart';
// import 'package:tomiru_social_flutter/features/checkout/controllers/checkout_controller.dart';
import 'package:tomiru_social_flutter/features/dashboard/domain/services/dashboard_service_interface.dart';
// import 'package:tomiru_social_flutter/features/location/controllers/location_controller.dart';
// import 'package:tomiru_social_flutter/helper/address_helper.dart';
import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardController extends GetxController implements GetxService {
  final DashboardServiceInterface dashboardServiceInterface;
  DashboardController({required this.dashboardServiceInterface});

  bool _showLocationSuggestion = true;
  bool get showLocationSuggestion => _showLocationSuggestion;

  void hideSuggestedLocation() {
    _showLocationSuggestion = !_showLocationSuggestion;
  }

  Future<bool> saveRegistrationSuccessfulSharedPref(bool status) async {
    return await dashboardServiceInterface.saveRegistrationSuccessful(status);
  }

  Future<bool> saveIsRestaurantRegistrationSharedPref(bool status) async {
    return await dashboardServiceInterface.saveIsRestaurantRegistration(status);
  }

  bool getRegistrationSuccessfulSharedPref() {
    return dashboardServiceInterface.getRegistrationSuccessful();
  }

  bool getIsRestaurantRegistrationSharedPref() {
    return dashboardServiceInterface.getIsRestaurantRegistration();
  }
}
