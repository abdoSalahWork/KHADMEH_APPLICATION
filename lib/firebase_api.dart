import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:khedma/Utils/utils.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   if (Firebase.apps.isEmpty) await Firebase.initializeApp();
  //   print('Handling a background message ${message.messageId}');
  // }

  // handleNotifications() async {
  //   FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //       badge: true,
  //       alert: true,
  //       sound:
  //           true); //presentation options for Apple notifications when received in the foreground.

  //   FirebaseMessaging.onMessage.listen((message) async {
  //     print('Got a message whilst in the FOREGROUND!');
  //     return;
  //   }).onData((data) {
  //     print('Got a DATA message whilst in the FOREGROUND!');
  //     print('data from stream: ${data.data}');
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((message) async {
  //     print('NOTIFICATION MESSAGE TAPPED');
  //     return;
  //   }).onData((data) {
  //     print('NOTIFICATION MESSAGE TAPPED');
  //     print('data from stream: ${data.data}');
  //   });

  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //       (value) => value != null ? _firebaseMessagingBackgroundHandler : false);
  //   return;
  // }

  Future<void> initNotifications() async {
    String? tmp = await Utils.readFBToken();
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    logError(fcmToken!);
    if (tmp == null) {
      await Utils.saveFBToken(token: fcmToken);
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');

      if (message.notification != null) {
        try {
          Utils.notificationService.showLocalNotification(
              id: 1,
              title: message.notification!.title!,
              body: message.notification!.body!,
              payload: message.notification!.body!);
        } catch (e) {
          logError(e);
        }
      }
    });
  }
}
