import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/core/constants/strings.dart';
import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:get/get.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 0) {
          Get.offAllNamed(Routes.home);
        } else if (value == 1) {
          Get.toNamed(Routes.itemList);
        } else if (value == 2) {
          // Get.toNamed(Routes.settings);
          Get.toNamed(Routes.splash);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: UiStrings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: UiStrings.list,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: UiStrings.settings,
        ),
      ],
    );
  }
}
