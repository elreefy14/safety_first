import 'dart:async';
import 'dart:developer';
import 'package:safety_frist/core/services/notification/notification_repository.dart';

class TokenRefresher {
  final NotificationRepository notification;

  Timer? _timer;

  TokenRefresher({required this.notification});

  void start() {
    // Refresh every 55 minutes (less than 1 hour to be safe)
    _timer = Timer.periodic(Duration(minutes: 55), (timer) async {
      try {
        await notification.refreshToken();
        log('✅ Token refreshed automatically');
      } catch (e) {
        log('❌ Failed to refresh token: $e');
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }
}
