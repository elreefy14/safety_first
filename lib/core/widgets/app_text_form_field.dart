import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscureText;
  final bool? enabled;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final Color? backGroundColorHint;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Function(String? value)? onChanged;
  final FocusNode? focusNode;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscureText,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.contentPadding,
    this.hintTextStyle,
    this.backGroundColorHint,
    this.textInputType,
    this.controller,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.enabled,
    this.labelText,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: textInputType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      obscureText: isObscureText ?? false,
      readOnly: !(enabled ?? true),
      autofocus: false,
      style: inputTextStyle ?? Theme.of(context).textTheme.titleSmall,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? Theme.of(context).inputDecorationTheme.contentPadding,
        focusedBorder: focusedBorder ?? Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: enabledBorder ?? Theme.of(context).inputDecorationTheme.enabledBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        hintText: hintText,
        hintStyle: hintTextStyle ?? Theme.of(context).textTheme.bodySmall!,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: Theme.of(context).iconTheme.color!,
        prefixIconColor: Theme.of(context).iconTheme.color!,
      ),
      validator: validator != null ? (value) => validator!(value) : null,
    );
  }
}

