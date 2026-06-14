import 'package:breezy/client/bookings/presentation/client_bookings_history_view.dart';
import 'package:breezy/client/accounts/client_profile_view.dart';
import 'package:breezy/core/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../cleaner/accounts/presentation/cleaner_profile_view.dart';
import '../../../cleaner/accounts/presentation/cleaner_registration_view.dart';
import '../../../cleaner/accounts/presentation/profile_details_view.dart';
import '../../../cleaner/bookings/presentation/cleaner_schedule_view.dart';
import '../../../cleaner/bookings/presentation/earnings_view.dart';
import '../../../cleaner/shared/presentation/cleaner_home_view.dart';
import '../../../cleaner/shared/presentation/components/cleaner_navigation_bar.dart';
import '../../../client/bookings/presentation/booking_confirmation_view.dart';
import '../../../client/bookings/presentation/cleaner_details_view.dart';
import '../../../client/bookings/presentation/cleaner_rating_view.dart';
import '../../../client/bookings/presentation/cleaning_lifecycle_view.dart';
import '../../../client/bookings/presentation/client_booking_view.dart';
import '../../../client/bookings/presentation/client_homes_view.dart';
import '../../../client/bookings/presentation/payment_confirmation_view.dart';
import '../../../client/shared/presentation/client_home_view.dart';
import '../../../client/bookings/presentation/history.dart';
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

@TypedStatefulShellRoute<ClientMainTabsRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: AppRoutes.clientHome,

          routes: [
            TypedGoRoute<CleanerDetailsRoute>(
              path: AppRoutes.cleanerDetailsView,
              routes: [
                TypedGoRoute<ClientBookingRoute>(
                  path: AppRoutes.clientBookingView,
                  routes: [
                    TypedGoRoute<ClientBookingConfirmationRoute>(
                      path: AppRoutes.bookingConfirmationView,
                      routes: [
                        TypedGoRoute<CleaningLifeCycleRoute>(
                          path: AppRoutes.cleaningLifeCycle,
                          routes: [
                            TypedGoRoute<PaymentConfirmationRoute>(
                              path: AppRoutes.paymentConfirmation,
                              routes: [
                                TypedGoRoute<CleanerRatingRoute>(
                                  path: AppRoutes.cleanerRatingView,
                                  routes: [
                        
                    
                  ]
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

    TypedStatefulShellBranch(
      routes: [TypedGoRoute<BookingsRoute>(path: AppRoutes.clientBookings)],
    ),
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<HistoryRoute>(path: AppRoutes.history)],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: AppRoutes.clientProfile,
          routes: [
            TypedGoRoute<ManageHomesRoute>(
              path: AppRoutes.manageHomes,
              routes: [
                        
                    
                  ]
                ),
          ],
        ),
      ],
    ),
  ],
)
class ClientMainTabsRoute extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey =
      clientShellNavigatorKey;
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
    return const ClientProfileView();
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
    return //CleanerRegistrationView();
    CleanerRegistrationView();
  }
}

@TypedGoRoute<UserCategoryRoute>(path: AppRoutes.usercategory)
class UserCategoryRoute extends GoRouteData with $UserCategoryRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserCategoryView();
  }
}

@TypedStatefulShellRoute<CleanerMainTabsRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<CleanerHomeRoute>(path: AppRoutes.cleanerHome)],
    ),

    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<CleanerBookingsRoute>(path: AppRoutes.cleanerBookings),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<EarningsRoute>(path: AppRoutes.earnings)],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<CleanerProfileRoute>(
          path: AppRoutes.cleanerProfile,
          routes: [
            TypedGoRoute<CleanerProfileDetailsRoute>(
              path: AppRoutes.cleanerProfileDetails,
            ),
          ],
        ),
      ],
    ),
  ],
)
class CleanerMainTabsRoute extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey =
      cleanerShellNavigatorKey;
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return CleanerNavigationBar(navigationShell: navigationShell);
  }
}

class CleanerHomeRoute extends GoRouteData with $CleanerHomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerHomeView();
  }
}

class EarningsRoute extends GoRouteData with $EarningsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EarningsView();
  }
}

class CleanerProfileRoute extends GoRouteData with $CleanerProfileRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerProfileView();
  }
}

class CleanerBookingsRoute extends GoRouteData with $CleanerBookingsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerBookingsView();
  }
}

@TypedGoRoute<CleanerProfileDetailsRoute>(path: AppRoutes.cleanerProfileDetails)
class CleanerProfileDetailsRoute extends GoRouteData
    with $CleanerProfileDetailsRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerProfileDetailsView();
  }
}

@TypedGoRoute<CleanerDetailsRoute>(path: AppRoutes.cleanerDetailsView)
class CleanerDetailsRoute extends GoRouteData with $CleanerDetailsRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerDetailsView();
  }
}

@TypedGoRoute<ClientBookingRoute>(path: AppRoutes.clientBookingView)
class ClientBookingRoute extends GoRouteData with $ClientBookingRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ClientBookingView();
  }
}

@TypedGoRoute<ClientBookingConfirmationRoute>(
  path: AppRoutes.bookingConfirmationView,
)
class ClientBookingConfirmationRoute extends GoRouteData
    with $ClientBookingConfirmationRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingConfirmationView();
  }
}

@TypedGoRoute<CleaningLifeCycleRoute>(path: AppRoutes.cleaningLifeCycle)
class CleaningLifeCycleRoute extends GoRouteData with $CleaningLifeCycleRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleaningLifeCycleView();
  }
}

@TypedGoRoute<PaymentConfirmationRoute>(path: AppRoutes.paymentConfirmation)
class PaymentConfirmationRoute extends GoRouteData
    with $PaymentConfirmationRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PaymentConfirmationView();
  }
}

@TypedGoRoute<CleanerRatingRoute>(path: AppRoutes.cleanerRatingView)
class CleanerRatingRoute extends GoRouteData with $CleanerRatingRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CleanerRatingView();
  }
}

@TypedGoRoute<ManageHomesRoute>(path: AppRoutes.manageHomes)
class ManageHomesRoute extends GoRouteData with $ManageHomesRoute {
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ClientHomesView();
  }
}
