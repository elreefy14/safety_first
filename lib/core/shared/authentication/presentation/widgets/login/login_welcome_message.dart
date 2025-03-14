import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/build_welcome_message.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/welcome_message_model.dart';

class MenteeWelcomeMessageWidget extends StatelessWidget {
  const MenteeWelcomeMessageWidget({super.key, required this.userType});

  final UserType userType;

  @override
  Widget build(BuildContext context) {
    WelcomeMessage message = buildWelcomeMessage(userType);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message.messageTitile,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        verticalSpace(8),
        Text(
          message.messageContent,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
