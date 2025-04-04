import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/register/register_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AutofillGroup(
        child: Form(
          key: RegisterCubit.get(context).formKeyConfirm,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'لا يمكن ترك الكود فارغ';
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(22),
              AppTextButton(
                textButton: 'التحقق من الرمز',
                onPressed: () {
                  if (RegisterCubit.get(
                    context,
                  ).formKeyConfirm.currentState!.validate()) {
                    RegisterCubit.get(
                      context,
                    ).confirmEmail(otpCode: textEditingController.text);
                  }
                },
              ),
              verticalSpace(22),
              GestureDetector(
                onTap: () {
                  RegisterCubit.get(context).resendOtpConfirmEmail();
                },
                child: Text(
                  'إعادة إرسال الرمز',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
