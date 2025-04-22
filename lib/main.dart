import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/app/safety_first_app.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize core services
    await setupGetIt();
    await CacheHelper.init();
    await ScreenUtil.ensureScreenSize();

    // Uncomment these if you need Firebase functionality
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // await PushNotificationsService.init();
    // await LocalNotificationService.init();
    // final notificationRepo = NotificationRepository();
    // final refresher = TokenRefresher(notification: notificationRepo);
    // await notificationRepo.refreshToken();
    // refresher.start();

    runApp(const SafetyFirstApp());
  } catch (e, stackTrace) {
    print('Error during initialization: $e');
    print('Stack trace: $stackTrace');
    rethrow;
  }
}
