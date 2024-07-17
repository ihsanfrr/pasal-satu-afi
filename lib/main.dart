import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/common.dart';
import 'routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      title: 'Era Maju Abadi',
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      initialBinding: AppBinding(),
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      defaultTransition: Transition.rightToLeft,
      locale: Get.deviceLocale ?? const Locale('id'),
      transitionDuration: Get.defaultTransitionDuration,
    ),
  );
}
