import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/data/services/app_controller.dart';
import 'package:get/get.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<AppController>(
        builder: (app) => IconButton(
          icon: Icon(app.isDarkMode ? Icons.nightlight_round : Icons.sunny),
          onPressed: () => app.toggleDarkMode(),
        ),
      );
}
