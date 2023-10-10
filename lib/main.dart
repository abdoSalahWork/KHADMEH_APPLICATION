import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:khedma/Utils/notification_service.dart';
import 'package:khedma/firebase_api.dart';
import 'package:sizer/sizer.dart';

import 'Locals/langs.dart';
import 'Pages/splash/splash_page.dart';
import 'Themes/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.restoreSystemUIOverlays();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().initializePlatformNotifications();
  await FirebaseApi().initNotifications();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  // await FirebaseApi().handleNotifications();

  // await Utils.initializeNotifications(Utils.flutterLocalNotificationsPlugin);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.transparent, // navigation bar color
  //   statusBarColor: Colors.transparent, // status bar color
  // ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  // ThemesController themesController = Get.put(ThemesController());

  // await themesController.getThemeMode();
  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      enabled: false,
      // devices: [
      //   DeviceInfo.genericPhone(
      //     platform: TargetPlatform.iOS,
      //     id: "my-phone",
      //     name: "5.5 ihone",
      //     screenSize: const Size(1242 / 3, 2208 / 3),
      //     pixelRatio: 3,
      //   ),
      //   DeviceInfo.genericPhone(
      //     platform: TargetPlatform.iOS,
      //     id: "my-tab",
      //     name: "tab ihone",
      //     screenSize: const Size(2048 / 3, 2732 / 3),
      //     pixelRatio: 3,
      //   ),
      //   DeviceInfo.genericPhone(
      //     platform: TargetPlatform.iOS,
      //     id: "6.7",
      //     name: "6.7",
      //     screenSize: const Size(1284 / 3, 2778 / 3),
      //     pixelRatio: 3,
      //   ),
      //   DeviceInfo.genericPhone(
      //     platform: TargetPlatform.iOS,
      //     id: "6.5",
      //     name: "6.5",
      //     screenSize: const Size(1242 / 3, 2688 / 3),
      //     pixelRatio: 3,
      //   ),
      // ],

      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => MyApp(
          // themeMode: themesController.currentMode,
          ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        translations: LocaleString(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        title: 'Khedma',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.light,
        home: const SplashPage(),
        // routes: {
        //   '/notification':
        // },
      );
    });
  }
}
