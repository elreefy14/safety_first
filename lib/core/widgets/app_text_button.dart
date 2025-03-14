import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
  });

  final String textButton;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? const Color(0xFF103A69),
        ),
        overlayColor: WidgetStatePropertyAll(
          backgroundColor ?? const Color(0xFF103A69),
        ),
        elevation: WidgetStatePropertyAll(0.4),
        shadowColor: WidgetStatePropertyAll(
          Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      child: Text(
        textButton,
        style:
            textStyle ??
            Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}
