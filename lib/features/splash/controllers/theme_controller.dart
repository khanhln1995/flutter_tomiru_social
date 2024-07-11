import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:tomiru_social_flutter/features/splash/domain/services/splash_service_interface.dart';

class ThemeController extends GetxController implements GetxService {
  final SplashServiceInterface splashServiceInterface;

  ThemeController({required this.splashServiceInterface});

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  final String _lightMap = '[]';
  String get lightMap => _lightMap;

  final String _darkMap = '[]';
  String get darkMap => _darkMap;

  @override
  void onInit() {
    super.onInit();
    // Initialize theme data asynchronously
    init();
  }

  Future<void> init() async {
    // _lightMap = await rootBundle.loadString('assets/map/light_map.json');
    // _darkMap = await rootBundle.loadString('assets/map/dark_map.json');
    // _darkTheme = await splashServiceInterface.loadCurrentTheme();
    // update(); // Notify listeners after data is loaded
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    splashServiceInterface.toggleTheme(_darkTheme);
    update();
  }
}
