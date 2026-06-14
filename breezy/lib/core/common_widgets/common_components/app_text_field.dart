import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.borderColor,
    this.hintTextColor,
    this.onChanged,
    this.borderRadius,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines,
  });

  final String? hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final Color? borderColor;
  final Color? hintTextColor;
  final Function(String?)? onChanged;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.theme.colorScheme.onSurface,
      ),
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: autoValidateMode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: .never,
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: hintTextColor ?? context.theme.colorScheme.onSurfaceVariant,
        ),
        labelStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onSurfaceVariant,
        ),
        filled: true,
        fillColor: context.theme.colorScheme.surfaceContainerLow,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? context.theme.colorScheme.outlineVariant,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
