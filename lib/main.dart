import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_structure_application/app/app.dart';
import 'package:flutter_structure_application/app/data/services/bindings.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  // shared preferences
  await GetStorage.init();

  // WidgetsFlutterBinding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash (keep showing until app is ready)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // set Portrait Orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //firebase init
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // initialize Controller Services
  await AppBindings().dependencies();

  // Setup firebase crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  initializeDateFormatting();

  runApp(const MainApp());
}
