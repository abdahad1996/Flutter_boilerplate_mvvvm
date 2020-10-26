import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// @singleton
class SharedPreferencesService {
  static SharedPreferencesService _instance;

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance =
          SharedPreferencesService._(await SharedPreferences.getInstance());
    }

    return _instance;
  }

  final SharedPreferences _preferences;
  SharedPreferencesService._(this._preferences);

  // //TODO: MOVE TO ANOTHER CLASS
  // static const _ThemeIndexKey = 'user_key';
  // static const _UserThemeModeKey = 'user_theme_mode_key';

  // int get themeIndex => getFromDisk(_ThemeIndexKey);

  // set themeIndex(int value) => saveToDisk(_ThemeIndexKey, value);

  // ThemeMode get userThemeMode {
  //   var userThemeString = getFromDisk(_UserThemeModeKey);
  //   if (userThemeString == ThemeMode.dark.toString()) {
  //     return ThemeMode.dark;
  //   }

  //   if (userThemeString == ThemeMode.light.toString()) {
  //     return ThemeMode.light;
  //   }

  //   return null;
  // }

  // set userThemeMode(ThemeMode value) {
  //   if (value == null) {
  //     saveToDisk(_UserThemeModeKey, value);
  //   } else {
  //     var userTheme = value.toString();
  //     saveToDisk(_UserThemeModeKey, userTheme);
  //   }
  // }

  //generic methods
  void clearPreferences() {
    _preferences.clear();
  }

  dynamic getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
