import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'client/shared/presentation/components/client_navigation_bar_widget.dart';
import 'core/utils/router/app_router.dart';
import 'core/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: router,
        );
      },
    );
  }
}
