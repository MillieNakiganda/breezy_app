import 'package:breezy/core/utils/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final clientShellNavigatorKey = GlobalKey<NavigatorState>();
final cleanerShellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
  // initialLocation: kDebugMode
  //     ? AppRoutes.backendConnectionTest
  //     : AppRoutes.cleanerHome,
);
