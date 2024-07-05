import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_structure_application/app/core/constants/keys.dart';
import 'package:flutter_structure_application/app/core/constants/strings.dart';
import 'package:flutter_structure_application/app/core/themes/dark.dart';
import 'package:flutter_structure_application/app/core/themes/light.dart';
import 'package:flutter_structure_application/app/core/utils/box.dart';
import 'package:flutter_structure_application/app/data/routes/getpages.dart';
import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:flutter_structure_application/app/data/services/app_controller.dart';
import 'package:flutter_structure_application/app/data/services/bindings.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: UiStrings.appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: getPages,
      initialRoute: Routes.home,
      initialBinding: AppBindings(),
      onReady: () {
        FlutterNativeSplash.remove();

        // apply theme from disk
        final AppController appController = Get.find();
        bool isDarkModeOnDisk = Box.getBool(key: Keys.isDarkMode);
        bool isDarkModeOnApp = appController.isDarkMode;
        if (isDarkModeOnApp != isDarkModeOnDisk) {
          appController.toggleDarkMode();
        }
      },
    );
  }
}
