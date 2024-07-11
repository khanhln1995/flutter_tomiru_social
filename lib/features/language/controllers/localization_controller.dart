import 'package:tomiru_social_flutter/features/language/domain/models/language_model.dart';
import 'package:tomiru_social_flutter/features/language/domain/service/language_service_interface.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController implements GetxService {
  final LanguageServiceInterface languageServiceInterface;

  LocalizationController({required this.languageServiceInterface});

  Locale _locale = Locale(AppConstants.languages[0].languageCode!,
      AppConstants.languages[0].countryCode);
  Locale get locale => _locale;

  bool _isLtr = true;
  bool get isLtr => _isLtr;

  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;

  int _selectedLanguageIndex = 0;
  int get selectedLanguageIndex => _selectedLanguageIndex;

  @override
  void onInit() {
    super.onInit();
    // Initialize the controller, typically load initial language
    loadCurrentLanguage();
  }

  void setLanguage(Locale locale, {bool fromBottomSheet = false}) {
    // Update the application locale and related state variables
    Get.updateLocale(locale);
    _locale = locale;
    _isLtr = languageServiceInterface.setLTR(_locale);

    if (!fromBottomSheet) {
      saveLanguage(_locale); // Save the selected language to preferences
    }

    update(); // Notify listeners
  }

  void loadCurrentLanguage() {
    _locale = languageServiceInterface.getLocaleFromSharedPref();
    _isLtr = _locale.languageCode != 'ar'; // Example logic for RTL/LTR
    _selectedLanguageIndex = languageServiceInterface.setSelectedLanguageIndex(
        AppConstants.languages, _locale);
    _languages.addAll(AppConstants.languages); // Populate language list
    update(); // Notify listeners
  }

  void saveLanguage(Locale locale) {
    languageServiceInterface.saveLanguage(locale); // Save selected language
  }

  void searchLanguage(String query) {
    if (query.isEmpty) {
      _languages = AppConstants.languages; // Reset to all languages
    } else {
      _selectedLanguageIndex = -1; // Clear selected index
      _languages = AppConstants.languages
          .where((language) => language.languageName!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    update(); // Notify listeners
  }
}
