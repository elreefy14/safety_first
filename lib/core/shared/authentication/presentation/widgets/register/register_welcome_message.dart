import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';

class RegisterWelcomeMessage extends StatelessWidget {
  const RegisterWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'انضم إلينا وابدأ في حل مشاكلك',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        verticalSpace(8),
        Text(
          'أنشئ حسابك علشان تقدر تبلغ عن مشاكلك بسهولة، وتتابع حالة الطلبات، وتتواصل مع فريق الدعم',
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
