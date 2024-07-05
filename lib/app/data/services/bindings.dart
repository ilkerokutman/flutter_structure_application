import 'package:flutter_structure_application/app/data/services/app_controller.dart';
import 'package:flutter_structure_application/app/data/services/data_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync(
      () async => AppController(),
      permanent: true,
    );
    await Get.putAsync(
      () async => DataController(),
      permanent: true,
    );
  }
}
