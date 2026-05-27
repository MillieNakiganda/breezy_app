import 'package:flutter/material.dart';

import '../../utils/theme/theme_extensions.dart';

class AppIconButtonWidget extends StatelessWidget {
  const AppIconButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.borderSideWidth,
    this.borderSideColor,
    this.labelColor,
    this.buttonWidth,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? borderSideWidth;
  final Color? borderSideColor;
  final Color? labelColor;
  final double? buttonWidth;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.start,
      icon: icon,
      onPressed: onPressed,
      label: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          color: labelColor ?? context.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? context.theme.colorScheme.primary,
        minimumSize: Size(buttonWidth ?? double.infinity, 48),
        side: BorderSide(
          color: borderSideColor ?? Colors.transparent,
          width: borderSideWidth ?? 0,
        ),
      ),
    );
  }
}
