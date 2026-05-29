import 'package:breezy/core/utils/router/route_names.dart';
import 'package:breezy/core/utils/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
  initialLocation: AppRoutes.loginView,
);
