import 'package:flutter/material.dart';

import '../../utils/theme/theme_extensions.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.autoValidateMode,
  });

  final String? hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.theme.colorScheme.onSurface,
      ),
      validator: validator,
      autovalidateMode: autoValidateMode,

      decoration: InputDecoration(
        floatingLabelBehavior: .never,
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onSurfaceVariant,
        ),
        labelStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onSurfaceVariant,
        ),
        filled: true,
        fillColor: context.theme.colorScheme.surfaceContainerLow,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.outlineVariant,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
