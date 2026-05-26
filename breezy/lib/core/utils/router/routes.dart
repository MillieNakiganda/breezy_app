import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../onboarding/presentation/views/onboarding_view.dart';
part 'routes.g.dart';

@TypedGoRoute<OnboardingRoute>(path: '/')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnboardingView();
  }
}
