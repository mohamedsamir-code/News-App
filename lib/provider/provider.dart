import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  SharedPreferences? preferences;
  final String languageKey = 'language';


  String? getLanguage() {
    return preferences!.getString(languageKey);
  }

  Future<void> saveLanguage(String newLanguage) async {
    preferences!.setString(languageKey, newLanguage);
  }


  void changeLanguage(String langcode) {
    if (langcode == appLanguage) {
      return;
    }
    appLanguage = langcode;
    notifyListeners();
    saveLanguage(langcode);
  }
}
