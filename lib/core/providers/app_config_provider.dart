import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLang = 'e';
  ThemeMode appTheme = ThemeMode.light;

  void changeLang(String lang) {
    if (lang == appLang) {
      return;
    }
    appLang = lang;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }
}
