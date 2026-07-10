import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/server/server_client.dart';
import 'core/utils/router/app_router.dart';
import 'core/utils/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSize = 100;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20;
  debugInvertOversizedImages = kDebugMode;

  await ServerAuthLogic.initializeServerClient();
  //we may have to unawait this later
  await initializeAppRouter();

  runApp(ProviderScope(retry: (retryCount, error) => null, child: MyApp()));
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
