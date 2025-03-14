import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/extentions.dart';
import 'package:safety_frist/core/routes/routes.dart';

class ClientDontHaveAnAccount extends StatelessWidget {
  const ClientDontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToReplacement(Routes.clientRegisterScreen);
      },
      child: Text(
        'ليس لدي حساب',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
