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
  $cleanerDetailsRoute,
  $clientBookingRoute,
  $clientBookingConfirmationRoute,
  $cleaningLifeCycleRoute,
  $paymentConfirmationRoute,
  $cleanerRatingRoute,
  $manageHomesRoute,
  $cleanerNotificationsRoute,
  $cleanerAssignmentRoute,
  $cleanerActiveJobRoute,
  $cleanerBookingHistoryRoute,
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
        GoRouteData.$route(
          path: '/clientHome',
          factory: $HomeRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: '/cleanerDetailsView',
              factory: $CleanerDetailsRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/clientBookingView',
                  factory: $ClientBookingRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: '/clientBookingConfirmationView',
                      factory: $ClientBookingConfirmationRoute._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: '/cleaningLifeCycle',
                          factory: $CleaningLifeCycleRoute._fromState,
                          routes: [
                            GoRouteData.$route(
                              path: '/paymentConfirmationView',
                              factory: $PaymentConfirmationRoute._fromState,
                              routes: [
                                GoRouteData.$route(
                                  path: '/cleanerRatingView',
                                  factory: $CleanerRatingRoute._fromState,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
          routes: [
            GoRouteData.$route(
              path: '/manageHome',
              factory: $ManageHomesRoute._fromState,
            ),
          ],
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

mixin $CleanerDetailsRoute on GoRouteData {
  static CleanerDetailsRoute _fromState(GoRouterState state) =>
      CleanerDetailsRoute();

  @override
  String get location => GoRouteData.$location('/cleanerDetailsView');

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

mixin $ClientBookingRoute on GoRouteData {
  static ClientBookingRoute _fromState(GoRouterState state) =>
      ClientBookingRoute();

  @override
  String get location => GoRouteData.$location('/clientBookingView');

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

mixin $ClientBookingConfirmationRoute on GoRouteData {
  static ClientBookingConfirmationRoute _fromState(GoRouterState state) =>
      ClientBookingConfirmationRoute();

  @override
  String get location =>
      GoRouteData.$location('/clientBookingConfirmationView');

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

mixin $CleaningLifeCycleRoute on GoRouteData {
  static CleaningLifeCycleRoute _fromState(GoRouterState state) =>
      CleaningLifeCycleRoute();

  @override
  String get location => GoRouteData.$location('/cleaningLifeCycle');

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

mixin $PaymentConfirmationRoute on GoRouteData {
  static PaymentConfirmationRoute _fromState(GoRouterState state) =>
      PaymentConfirmationRoute();

  @override
  String get location => GoRouteData.$location('/paymentConfirmationView');

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

mixin $CleanerRatingRoute on GoRouteData {
  static CleanerRatingRoute _fromState(GoRouterState state) =>
      CleanerRatingRoute();

  @override
  String get location => GoRouteData.$location('/cleanerRatingView');

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

mixin $ManageHomesRoute on GoRouteData {
  static ManageHomesRoute _fromState(GoRouterState state) => ManageHomesRoute();

  @override
  String get location => GoRouteData.$location('/manageHome');

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
          routes: [
            GoRouteData.$route(
              path: '/cleanerNotifications',
              factory: $CleanerNotificationsRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/cleanerAssignmentView',
                  factory: $CleanerAssignmentRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: '/cleanerBookingHistory',
              factory: $CleanerBookingHistoryRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/cleanerActiveJob',
                  factory: $CleanerActiveJobRoute._fromState,
                ),
              ],
            ),
          ],
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

mixin $CleanerNotificationsRoute on GoRouteData {
  static CleanerNotificationsRoute _fromState(GoRouterState state) =>
      CleanerNotificationsRoute();

  @override
  String get location => GoRouteData.$location('/cleanerNotifications');

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

mixin $CleanerAssignmentRoute on GoRouteData {
  static CleanerAssignmentRoute _fromState(GoRouterState state) =>
      CleanerAssignmentRoute();

  @override
  String get location => GoRouteData.$location('/cleanerAssignmentView');

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

mixin $CleanerBookingHistoryRoute on GoRouteData {
  static CleanerBookingHistoryRoute _fromState(GoRouterState state) =>
      CleanerBookingHistoryRoute();

  @override
  String get location => GoRouteData.$location('/cleanerBookingHistory');

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

mixin $CleanerActiveJobRoute on GoRouteData {
  static CleanerActiveJobRoute _fromState(GoRouterState state) =>
      CleanerActiveJobRoute();

  @override
  String get location => GoRouteData.$location('/cleanerActiveJob');

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

RouteBase get $cleanerDetailsRoute => GoRouteData.$route(
  path: '/cleanerDetailsView',
  factory: $CleanerDetailsRoute._fromState,
);

RouteBase get $clientBookingRoute => GoRouteData.$route(
  path: '/clientBookingView',
  factory: $ClientBookingRoute._fromState,
);

RouteBase get $clientBookingConfirmationRoute => GoRouteData.$route(
  path: '/clientBookingConfirmationView',
  factory: $ClientBookingConfirmationRoute._fromState,
);

RouteBase get $cleaningLifeCycleRoute => GoRouteData.$route(
  path: '/cleaningLifeCycle',
  factory: $CleaningLifeCycleRoute._fromState,
);

RouteBase get $paymentConfirmationRoute => GoRouteData.$route(
  path: '/paymentConfirmationView',
  factory: $PaymentConfirmationRoute._fromState,
);

RouteBase get $cleanerRatingRoute => GoRouteData.$route(
  path: '/cleanerRatingView',
  factory: $CleanerRatingRoute._fromState,
);

RouteBase get $manageHomesRoute => GoRouteData.$route(
  path: '/manageHome',
  factory: $ManageHomesRoute._fromState,
);

RouteBase get $cleanerNotificationsRoute => GoRouteData.$route(
  path: '/cleanerNotifications',
  factory: $CleanerNotificationsRoute._fromState,
);

RouteBase get $cleanerAssignmentRoute => GoRouteData.$route(
  path: '/cleanerAssignmentView',
  factory: $CleanerAssignmentRoute._fromState,
);

RouteBase get $cleanerActiveJobRoute => GoRouteData.$route(
  path: '/cleanerActiveJob',
  factory: $CleanerActiveJobRoute._fromState,
);

RouteBase get $cleanerBookingHistoryRoute => GoRouteData.$route(
  path: '/cleanerBookingHistory',
  factory: $CleanerBookingHistoryRoute._fromState,
);
