import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/app/safety_first_app.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/services/local_notifications_service.dart';
import 'package:safety_frist/core/services/notification/notification_repository.dart';
import 'package:safety_frist/core/services/notification/notification_token_refresher.dart';
import 'package:safety_frist/core/services/push_notifications_service.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await PushNotificationsService.init();
  // await LocalNotificationService.init();
  // final notificationRepo = NotificationRepository();
  // final refresher = TokenRefresher(notification: notificationRepo);
  // await notificationRepo.refreshToken();

  // refresher.start();

  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(SafetyFirstApp());
}
