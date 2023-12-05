import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/Notifications/controller/notofication_controller.dart';
import 'package:khedma/Pages/chat%20page/controller/chat_controller.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Utils/notification_service.dart';
import 'package:khedma/firebase_api.dart';
import 'package:sizer/sizer.dart';

import 'Locals/langs.dart';
import 'Pages/splash/splash_page.dart';
import 'Themes/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Khedmah',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/splash',
      routes: {'/splash': (context) => const SplashPage()},
    );
  }));
  // Lazy initialization of controllers

  Get.lazyPut(() => GlobalController());
  Get.lazyPut(() => NotificationController());
  Get.lazyPut(() => ChatController());

  // Background initialization
  await _initializeBackgroundTasks();
}

Future<void> _initializeBackgroundTasks() async {
  final NotificationController notificationController =
      Get.find<NotificationController>();
  await NotificationService().initializePlatformNotifications();
  await FirebaseApi().initNotifications(notificationController);
  await FlutterDownloader.initialize();
}
