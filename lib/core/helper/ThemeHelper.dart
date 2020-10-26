import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/SharedPreferencesService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  final _sharedPreferences = locator<SharedPreferencesService>();

  static const _ThemeIndexKey = 'user_key';
  static const _UserThemeModeKey = 'user_theme_mode_key';

  int get themeIndex => _sharedPreferences.getFromDisk(_ThemeIndexKey);

  set themeIndex(int value) =>
      _sharedPreferences.saveToDisk(_ThemeIndexKey, value);

  ThemeMode get userThemeMode {
    var userThemeString = _sharedPreferences.getFromDisk(_UserThemeModeKey);
    if (userThemeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (userThemeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return null;
  }

  set userThemeMode(ThemeMode value) {
    if (value == null) {
      _sharedPreferences.saveToDisk(_UserThemeModeKey, value);
    } else {
      var userTheme = value.toString();
      _sharedPreferences.saveToDisk(_UserThemeModeKey, userTheme);
    }
  }
}
