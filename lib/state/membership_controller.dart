import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/service_register.dart';

class MembershipController extends GetxController {
  void registerMembership(String title) {
    // Logic for registering membership
    print("Registering membership: $title");
    
    // Navigate to the payment success screen
    Get.to(ServiceRegisterForm(
      packageName: title,
      price: '0.00',
      period: 'month',
    ));
  }
}
