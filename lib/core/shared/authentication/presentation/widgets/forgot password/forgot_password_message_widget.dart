import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/is_arabic.dart';

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
        onPressed: () {},
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
