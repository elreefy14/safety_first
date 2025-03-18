import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/profile/presentation/widgets/card_setting_item_widget.dart';
import 'package:safety_frist/users/client/profile/presentation/widgets/notification_playing_widget.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardSettingItemWidget(
          title: 'تعديل الملف الشخصي',
          image: 'assets/icons/user-pen.svg',
          onTap: () {},
        ),
        Divider(color: Colors.grey),
        CardSettingItemWidget(
          title: 'تغيير الباسورد',
          image: 'assets/icons/password-lock.svg',
          onTap: () {},
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
