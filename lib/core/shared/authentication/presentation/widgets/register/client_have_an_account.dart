import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/routes/routes.dart';

class ClientHaveAnAccount extends StatelessWidget {
  const ClientHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacement(Routes.userTypeScreen);
      },
      child: Text(
        'لدي حساب بالفعل',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
