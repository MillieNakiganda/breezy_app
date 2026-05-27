import 'package:flutter/material.dart';

import '../../utils/theme/theme_extensions.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.borderSideWidth,
    this.borderSideColor,
    this.labelColor,
    this.buttonWidth,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? borderSideWidth;
  final Color? borderSideColor;
  final Color? labelColor;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? context.theme.colorScheme.primary,
        minimumSize: Size(buttonWidth ?? double.infinity, 48),
        side: BorderSide(
          color: borderSideColor ?? Colors.transparent,
          width: borderSideWidth ?? 0,
        ),
      ),
      child: Text(
        label,
        style: context.textTheme.bodyMedium?.copyWith(
          color: labelColor ?? context.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
