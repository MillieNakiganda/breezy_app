import 'package:breezy/client/bookings/bookings.dart';
import 'package:breezy/client/accounts/profile.dart';
import 'package:breezy/core/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../client/accounts/client_registration_view.dart';
import '../../../client/shared/presentation/client_home_view.dart';
import '../../../client/bookings/history.dart';
import '../../../client/shared/presentation/components/client_navigation_bar_widget.dart';
import '../../common_widgets/login_view.dart';
import '../../common_widgets/onboarding/presentation/views/onboarding_view.dart';
import '../../common_widgets/onboarding/presentation/views/user_category_view.dart';
import 'route_names.dart';
part 'routes.g.dart';

@TypedGoRoute<OnboardingRoute>(path: '/')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnboardingView();
  }
}

@TypedStatefulShellRoute<MainTabsRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<HomeRoute>(path: AppRoutes.home)],
    ),

    TypedStatefulShellBranch(
      routes: [TypedGoRoute<BookingsRoute>(path: AppRoutes.bookings)],
    ),
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<HistoryRoute>(path: AppRoutes.history)],
    ),
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<ProfileRoute>(path: AppRoutes.profile)],
    ),
  ],
)
class MainTabsRoute extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ClientNavigationBar(navigationShell: navigationShell);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ClientHomeView();
  }
}

class HistoryRoute extends GoRouteData with $HistoryRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HistoryView();
  }
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileView();
  }
}

class BookingsRoute extends GoRouteData with $BookingsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingsView();
  }
}

@TypedGoRoute<LoginRoute>(path: AppRoutes.loginView)
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginView();
  }
}

@TypedGoRoute<RegistrationRoute>(path: AppRoutes.registrationView)
class RegistrationRoute extends GoRouteData with $RegistrationRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ClientRegistrationView();
  }
}

@TypedGoRoute<UserCategoryRoute>(path: AppRoutes.usercategory)
class UserCategoryRoute extends GoRouteData with $UserCategoryRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserCategoryView();
  }
}

//childreen of the branch sells will have this static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
