import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_structure_application/app/core/constants/keys.dart';
import 'package:get_storage/get_storage.dart';

class Box {
  //#region BASE METHODS
  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    final box = GetStorage();
    await box.write(key, value);
  }

  static String getString({
    required String key,
    String? defaultVal,
  }) {
    final box = GetStorage();
    return box.read(key) ?? (defaultVal ?? "");
  }

  static Future<void> setInt({
    required String key,
    required int value,
  }) async {
    final box = GetStorage();
    await box.write(key, value);
  }

  static int getInt({
    required String key,
    int? defaultVal,
  }) {
    final box = GetStorage();
    return box.read(key) ?? defaultVal ?? 0;
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    final box = GetStorage();
    await box.write(key, value);
  }

  static bool getBool({
    required String key,
    bool? defaultVal,
  }) {
    final box = GetStorage();
    return box.read(key) ?? defaultVal ?? false;
  }
  //#endregion

  //#region DEVICE-ID
  static String get deviceId {
    String id = getString(key: Keys.deviceId, defaultVal: "");
    if (id.isNotEmpty) {
      return id;
    } else {
      String newId = Guid.newGuid.toString();
      setString(key: Keys.deviceId, value: newId);
      return newId;
    }
  }
  //#endregion
}
