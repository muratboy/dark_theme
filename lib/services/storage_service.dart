import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/theme_button.dart';

const String themeKey = 'theme';

/// Store data in storage
class StorageService {
  static SharedPreferences? flutterStorage;

  /// Save the chosen theme mode by the user to the storage
  static void setThemeMode(String value) async {
    await flutterStorage?.setString(themeKey, value);
  }

  /// Get the theme mode from the storage
  static void initThemeMode() async {
    await SharedPreferences.getInstance().then((storage) {
      flutterStorage = storage;
      var value = flutterStorage?.getString(themeKey);
      if (value == 'isDark') {
        darkThemeOn.value = ThemeMode.dark;
      } else {
        darkThemeOn.value = ThemeMode.light;
      }
    });
  }
}
