import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';

class PinCodeVerification extends StatefulWidget {
  const PinCodeVerification({super.key});

  @override
  State<PinCodeVerification> createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        child: Column(
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              obscuringCharacter: '*',
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              controller: textEditingController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveColor: Colors.blue,
              ),
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  currentText = value;
                });
              },
            ),
            verticalSpace(22),
            AppTextButton(
              textButton: 'التحقق من الرمز',
              onPressed: () {
                // context.navigateTo(Routes.changePasswordScreen);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 22.h),
              child: Text(
                '00:46',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'إعادة إرسال الرمز',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Timer timer() => Timer.periodic(const Duration(seconds: 50), (timer) {});
}
