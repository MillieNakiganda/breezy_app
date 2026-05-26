import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
