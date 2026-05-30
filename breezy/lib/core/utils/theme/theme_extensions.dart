import 'package:flutter/material.dart';

import 'color_extension.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension AppColorsExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
