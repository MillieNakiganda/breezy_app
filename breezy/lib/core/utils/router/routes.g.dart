// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $onboardingRoute,
  $clientMainTabsRoute,
  $loginRoute,
  $registrationRoute,
  $userCategoryRoute,
  $cleanerMainTabsRoute,
  $cleanerProfileDetailsRoute,
];

RouteBase get $onboardingRoute =>
    GoRouteData.$route(path: '/', factory: $OnboardingRoute._fromState);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) => OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $clientMainTabsRoute => StatefulShellRouteData.$route(
  factory: $ClientMainTabsRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/clientHome', factory: $HomeRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/clientBookings',
          factory: $BookingsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/history', factory: $HistoryRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/clientProfile',
          factory: $ProfileRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $ClientMainTabsRouteExtension on ClientMainTabsRoute {
  static ClientMainTabsRoute _fromState(GoRouterState state) =>
      ClientMainTabsRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location('/clientHome');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BookingsRoute on GoRouteData {
  static BookingsRoute _fromState(GoRouterState state) => BookingsRoute();

  @override
  String get location => GoRouteData.$location('/clientBookings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HistoryRoute on GoRouteData {
  static HistoryRoute _fromState(GoRouterState state) => HistoryRoute();

  @override
  String get location => GoRouteData.$location('/history');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => ProfileRoute();

  @override
  String get location => GoRouteData.$location('/clientProfile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationRoute => GoRouteData.$route(
  path: '/registration',
  factory: $RegistrationRoute._fromState,
);

mixin $RegistrationRoute on GoRouteData {
  static RegistrationRoute _fromState(GoRouterState state) =>
      RegistrationRoute();

  @override
  String get location => GoRouteData.$location('/registration');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userCategoryRoute => GoRouteData.$route(
  path: '/userCategory',
  factory: $UserCategoryRoute._fromState,
);

mixin $UserCategoryRoute on GoRouteData {
  static UserCategoryRoute _fromState(GoRouterState state) =>
      UserCategoryRoute();

  @override
  String get location => GoRouteData.$location('/userCategory');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cleanerMainTabsRoute => StatefulShellRouteData.$route(
  factory: $CleanerMainTabsRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/cleanerHome',
          factory: $CleanerHomeRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/cleanerBookings',
          factory: $CleanerBookingsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/earnings',
          factory: $EarningsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/cleanerProfile',
          factory: $CleanerProfileRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: '/cleanerProfileDetails',
              factory: $CleanerProfileDetailsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $CleanerMainTabsRouteExtension on CleanerMainTabsRoute {
  static CleanerMainTabsRoute _fromState(GoRouterState state) =>
      CleanerMainTabsRoute();
}

mixin $CleanerHomeRoute on GoRouteData {
  static CleanerHomeRoute _fromState(GoRouterState state) => CleanerHomeRoute();

  @override
  String get location => GoRouteData.$location('/cleanerHome');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CleanerBookingsRoute on GoRouteData {
  static CleanerBookingsRoute _fromState(GoRouterState state) =>
      CleanerBookingsRoute();

  @override
  String get location => GoRouteData.$location('/cleanerBookings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EarningsRoute on GoRouteData {
  static EarningsRoute _fromState(GoRouterState state) => EarningsRoute();

  @override
  String get location => GoRouteData.$location('/earnings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CleanerProfileRoute on GoRouteData {
  static CleanerProfileRoute _fromState(GoRouterState state) =>
      CleanerProfileRoute();

  @override
  String get location => GoRouteData.$location('/cleanerProfile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CleanerProfileDetailsRoute on GoRouteData {
  static CleanerProfileDetailsRoute _fromState(GoRouterState state) =>
      CleanerProfileDetailsRoute();

  @override
  String get location => GoRouteData.$location('/cleanerProfileDetails');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cleanerProfileDetailsRoute => GoRouteData.$route(
  path: '/cleanerProfileDetails',
  factory: $CleanerProfileDetailsRoute._fromState,
);
