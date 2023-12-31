import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/core/helpers/app_keys.dart';
import 'app/core/languages/app_translation.dart';
import 'app/routes/app_pages.dart';

late SharedPreferences preferences;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
  );

  await GetStorage.init();
  preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translationsKeys,
      locale: Locale(preferences.getString(AppKeys.languageCode) ?? 'en'),
      fallbackLocale: Locale(preferences.getString(AppKeys.languageCode) ?? 'en'),
      popGesture: true,
    ),);
}


