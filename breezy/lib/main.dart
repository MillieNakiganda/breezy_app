import 'package:flutter/material.dart';

import 'core/utils/router/app_router.dart';
import 'core/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(theme: AppTheme.lightTheme, routerConfig: router);
  }
}
