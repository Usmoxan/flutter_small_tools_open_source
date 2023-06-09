import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/screens/json_to_dart/models/config.dart';
import 'package:flutter_gradient_maker/screens/splash_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

import 'screens/json_to_dart/main_controller.dart';

Future<void> main() async {
  // It is required to add the following to run the meta_seo package correctly
  // before the running of the Flutter app
  await Hive.initFlutter();
  await ConfigSetting().init();
  Get.put(MainController());
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Add MetaSEO just into Web platform condition
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Usmoxan');
      meta.description(
          description:
              'Gradient maker app for Flutter and Container editor, Color shade Generator, HEX to RGBA converter. The app is not fully finished Flutter little tools for you please use for free.');
      meta.keywords(
          keywords:
              'Flutter, Dart, Flutter Gradient, Gradient Maker Flutter, Web');
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Small Tools',
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      builder: FlutterSmartDialog.init(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ConfigSetting().locale.value,
    );
  }
}
