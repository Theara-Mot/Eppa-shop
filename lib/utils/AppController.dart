import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  ThemeMode currentTheme = ThemeMode.system;

  void toggleTheme(BuildContext context) {
    if (currentTheme == ThemeMode.light) {
      currentTheme = ThemeMode.dark;
    } else if (currentTheme == ThemeMode.dark) {
      currentTheme = ThemeMode.light;
    } else {
      if(Theme.of(context).brightness == Brightness.dark) {
        currentTheme = ThemeMode.light;
      } else {
        currentTheme = ThemeMode.dark;
      }
    }
    Get.changeThemeMode(currentTheme);
  }
}