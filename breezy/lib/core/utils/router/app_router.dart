import 'package:breezy/core/server/server_client.dart';
import 'package:breezy/core/utils/onboarding_prefs.dart';
import 'package:breezy/core/utils/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'route_names.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final clientShellNavigatorKey = GlobalKey<NavigatorState>();
final cleanerShellNavigatorKey = GlobalKey<NavigatorState>();

const _onboardingRoute = '/';

const _unauthenticatedPublicRoutes = {
  AppRoutes.loginView,
  AppRoutes.registrationView,
  AppRoutes.usercategory,
  AppRoutes.backendConnectionTest,
};

bool _isUnauthenticatedPublicRoute(String location) =>
    _unauthenticatedPublicRoutes.contains(location);

String _resolveInitialLocation(bool hasOnboarded) {
  if (!hasOnboarded) return _onboardingRoute;
  return AppRoutes.loginView;
}

late final GoRouter router;

Future<void> initializeAppRouter() async {
  final hasOnboarded = await OnboardingPrefs.hasOnboarded();

  router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    initialLocation: _resolveInitialLocation(hasOnboarded),
    refreshListenable: ServerAuthLogic.serverClient.auth.authInfoListenable,
    redirect: (context, state) async {
      final hasOnboarded = await OnboardingPrefs.hasOnboarded();
      final isAuthenticated = ServerAuthLogic.isServerAuthenticated;
      final location = state.matchedLocation;

      if (!hasOnboarded) {
        return location == _onboardingRoute ? null : _onboardingRoute;
      }

      if (!isAuthenticated) {
        if (location == _onboardingRoute) {
          return AppRoutes.loginView;
        }
        if (_isUnauthenticatedPublicRoute(location)) {
          return null;
        }
        return AppRoutes.loginView;
      }

      final isEntryRoute =
          location == _onboardingRoute ||
          _isUnauthenticatedPublicRoute(location);
      if (isEntryRoute && location != AppRoutes.backendConnectionTest) {
        return ServerAuthLogic.getAuthenticatedHomeRoute();
      }

      return null;
    },
  );
}
