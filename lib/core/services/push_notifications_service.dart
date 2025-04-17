import 'dart:developer';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:push_notifications/services/local_notifications_service.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token;

  static Future init() async {
    await messaging.requestPermission();
    await messaging.getToken().then((value) {
      log('$value');

      sendTokenToServer(value!);
    });

    messaging.onTokenRefresh.listen((value) {
      sendTokenToServer(value);
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    //foreground
    //  handleForegroundMessage();
    messaging.subscribeToTopic('all').then((val) {});

    // messaging.unsubscribeFromTopic('all');
  }

  Future<String?> getUserToken() async {
    return token = await messaging.getToken();
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  // static void handleForegroundMessage() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     // show local notification
  //     LocalNotificationService.showBasicNotification(message);
  //   });
  // }

  Future<void> sendNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final callable = FirebaseFunctions.instance.httpsCallable(
      'sendCustomNotification',
    );
    try {
      final response = await callable.call({
        'token': token,
        'title': title,
        'body': body,
        'data': data ?? {},
      });

      print('Notification sent: ${response.data}');
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  static void sendTokenToServer(String token) {
    // option 1 => API
    // option 2 => Firebase
  }
}
/*
  1.Permissions [done]
  2.fcm token [done]
  3.test using token with Firebase [done]
  4.fire notification [background] [done]
  5.fire notification [killed] [done]
  6.fire notification [foreground] [done]
  7.test using token with Postman [done]
  8.send Image with notification [done]
  9.send notfification with custom sound [done]
  10.send token to server [done]
  11.topic [done]
 */