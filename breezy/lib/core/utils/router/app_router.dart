import 'package:breezy/core/utils/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
);
