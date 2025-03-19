import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/card_setting_item_widget.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/notification_playing_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardSettingItemWidget(
          title: 'الملف الشخصي',
          image: 'assets/icons/user-pen.svg',
          onTap: () {
            context.push(Routes.profileScreen);
          },
        ),
        Divider(color: Colors.grey),
        const NotificationPlayingWidget(),
        Divider(color: Colors.grey),
        CardSettingItemWidget(
          title: 'قيمنا الأن',
          image: 'assets/icons/feedback-review.svg',
          onTap: () {},
        ),
        Divider(color: Colors.grey),
        CardSettingItemWidget(
          title: 'تسجيل الخروج',
          image: 'assets/icons/power_settings_new.svg',
          color: Colors.red,
          onTap: () {},
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
