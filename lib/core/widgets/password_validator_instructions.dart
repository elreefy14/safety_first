import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/widgets/password_validations.dart';

class PasswordValidatorInstructions extends StatefulWidget {
  const PasswordValidatorInstructions({super.key});

  @override
  State<PasswordValidatorInstructions> createState() =>
      _PasswordValidatorInstructionsState();
}

class _PasswordValidatorInstructionsState
    extends State<PasswordValidatorInstructions> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PasswordValidations(
      hasLowerCase: hasLowerCase,
      hasUpperCase: hasUpperCase,
      hasSpecialCharacters: hasSpecialCharacters,
      hasNumber: hasNumber,
      hasMinLength: hasMinLength,
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
