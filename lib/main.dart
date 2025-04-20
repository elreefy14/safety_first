import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/app/safety_first_app.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  // await PushNotificationsService.init();
  // await LocalNotificationService.init();
  // final notificationRepo = NotificationRepository();
  // final refresher = TokenRefresher(notification: notificationRepo);
  // await notificationRepo.refreshToken();
  //
  // refresher.start();
  await ScreenUtil.ensureScreenSize();
  runApp( SafetyFirstApp());

}
