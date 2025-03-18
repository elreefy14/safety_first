import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/helper/functions/is_arabic.dart';
import 'package:safety_frist/core/routes/routes.dart';

class ForgotPasswordMessageWidget extends StatelessWidget {
  const ForgotPasswordMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isArabic() ? Alignment.centerLeft : Alignment.centerRight,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        onPressed: () {
          context.push(Routes.forgotPasswordScreen);
        },
        child: Text(
          'هل نسيت كلمة المرور ؟',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Color(0xff040B32)),
        ),
      ),
    );
  }
}
