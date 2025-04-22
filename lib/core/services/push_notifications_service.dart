// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:safety_frist/core/services/local_notifications_service.dart';
//
// class PushNotificationsService {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   String? token;
//
//   static Future init() async {
//     await messaging.requestPermission();
//     await messaging.getToken().then((value) {
//       //  sendTokenToServer(value!);
//     });
//
//     messaging.onTokenRefresh.listen((value) {
//       //  sendTokenToServer(value);
//     });
//     FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
//     //foreground
//     handleForegroundMessage();
//
//     // messaging.unsubscribeFromTopic('Admins');
//   }
//
//   Future<String?> getUserToken() async {
//     return token = await messaging.getToken();
//   }
//
//   static Future<void> handlebackgroundMessage(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log(message.notification?.title ?? 'null');
//   }
//
//   static void handleForegroundMessage() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // show local notification
//       LocalNotificationService.showBasicNotification(message);
//     });
//   }
//
// }
