import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/core/constants/keys.dart';
import 'package:flutter_structure_application/app/core/utils/box.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  //

  //#region DARK MODE
  final RxBool _isDarkMode = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;

  void toggleDarkMode() async {
    _isDarkMode.value = !isDarkMode;
    update();
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    await Box.setBool(key: Keys.isDarkMode, value: isDarkMode);
  }
  //#endregion
}
