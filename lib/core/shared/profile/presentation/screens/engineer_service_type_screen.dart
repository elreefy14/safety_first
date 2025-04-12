import 'package:flutter/material.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';

class EngineerServiceTypeScreen extends StatelessWidget {
  const EngineerServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الخدمات المتاحة'), leading: AppbarIcon()),
      floatingActionButton: AppTextButton(
        textButton: 'إضافة خدمة',
        onPressed: () {},
      ),
    );
  }
}
