import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          'يجب أن تحتوي على حرف صغير واحد على الأقل',
          hasLowerCase,
          context,
        ),
        buildValidationRow(
          'يجب أن تحتوي على حرف كبير واحد على الأقل',
          hasUpperCase,
          context,
        ),
        buildValidationRow(
          r'يجب أن تحتوي على رمز واحد على الأقل ( $, #, @,..)',
          hasSpecialCharacters,
          context,
        ),
        buildValidationRow(
          'يجب أن تحتوي على رقم واحد على الأقل',
          hasNumber,
          context,
        ),
        buildValidationRow(
          'يجب أن تتكون من 8 أحرف على الأقل',
          hasMinLength,
          context,
        ),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated, context) {
  return Row(
    children: [
      hasValidated
          ? Icon(Icons.check_rounded, color: Colors.green)
          : CircleAvatar(radius: 2.5, backgroundColor: Colors.black),
      horizontalSpace(6),
      Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          // decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? Colors.green : Colors.black,
        ),
      ),
    ],
  );
}
