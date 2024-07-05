import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    runTask();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> runTask() async {
    //TODO:
    // do something that must be in the splash screen

    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.home);
  }
}
