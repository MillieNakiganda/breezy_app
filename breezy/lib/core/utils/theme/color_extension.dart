import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.onSuccessContainer,
    required this.successColor,
    required this.successContainer,
  });

  final Color warning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color successColor;
  final Color successContainer;
  final Color onSuccessContainer;

  @override
  AppColors copyWith({
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? successColor,
    Color? onSuccessContainer,
    Color? successContainer,
  }) {
    return AppColors(
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      successColor: successColor ?? this.successColor,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      )!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      )!,
    );
  }
}
